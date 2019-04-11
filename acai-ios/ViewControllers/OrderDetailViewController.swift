//
//  OrderDetailViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import SnapKit
import UIKit

protocol DidSelectOptionDelegate: class {
    func deselectOption(at index: Int, for type: OrderOption.OptionType)
    func selectOption(at index: Int, for type: OrderOption.OptionType)
}

/// Presents detail and customization options for a menu item.
/// Requires menuItem variable to be set
class OrderDetailViewController: UIViewController {

    // MARK: View vars
    private var addToCartActionTabView: ActionTabView!
    private var backgroundGradient: CAGradientLayer!
    private var bottomFillerRect: UIView!
    private var collectionView: UICollectionView!
    private var listAdapter: ListAdapter!

    // MARK: Gesture recognizers
    private var addToCartTapGestureRecognizer: UITapGestureRecognizer!

    // MARK: Data
    var menuItem: MenuItem!
    private var optionSectionsMap: [OrderOption.OptionType: [OrderOption]] = [:]
    var quantity: NSNumber = 1

    // MARK: Constraint Constants
    private enum FileConstants {
        static let addToCartActionTabViewHeight = 55
        static let backgroundGradientScaleHeight: CGFloat = 0.6
        static let emptyItemHeight: CGFloat = 156
    }

    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Perform once here, then done in viewDidAppear (for popping back to the view)
        formatNavigationBar()

        title = menuItem.title

        // Use the defaults to set the initial selections
        optionSectionsMap = menuItem.defaultOptions

        backgroundGradient = CAGradientLayer()
        backgroundGradient.colors = [UIColor.sunshine.cgColor, UIColor.butterscotch.cgColor]
        backgroundGradient.locations = [0, 1]
        backgroundGradient.startPoint = CGPoint(x: 0, y: 0)
        backgroundGradient.endPoint = CGPoint(x: 1, y: 0.5)
        backgroundGradient.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: FileConstants.backgroundGradientScaleHeight * view.frame.height)
        view.layer.addSublayer(backgroundGradient)

        addToCartActionTabView = ActionTabView(frame: .zero, title: "Add to Cart", price: menuItem.price)
        view.addSubview(addToCartActionTabView)

        addToCartTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addToCart))
        addToCartActionTabView.addGestureRecognizer(addToCartTapGestureRecognizer)

        bottomFillerRect = UIView()
        bottomFillerRect.backgroundColor = .acaiBlack
        view.addSubview(bottomFillerRect)

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)

        listAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        listAdapter.collectionView = collectionView
        listAdapter.dataSource = self

        setupConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        formatNavigationBar()
    }

    private func formatNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .compact)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.avenirNextBold.withSize(24),
            .foregroundColor: UIColor.white
        ]
    }

    private func setupConstraints() {
        addToCartActionTabView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-FileConstants.addToCartActionTabViewHeight)
        }

        bottomFillerRect.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }

        collectionView.snp.makeConstraints { make in
            make.bottom.equalTo(addToCartActionTabView.snp.top)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }

    @objc func addToCart() {
        #if DEBUG
        print("addToCart pushed")
        #endif

        navigationController?.popViewController(animated: true)
    }

    private func updateAddToCartPrice() {
        let totalPrice = optionSectionsMap.keys.reduce(0) { (result, optionType) -> Double in
            return optionSectionsMap[optionType]!.reduce(result) { (result, option) -> Double in
                result + (option.isSelected ? option.price : 0.0)
            }
        }

        addToCartActionTabView.priceLabel.text = (totalPrice * quantity.doubleValue).asPriceString()
    }

}

extension OrderDetailViewController: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var sections: [ListDiffable] = []

        sections.append(EmptyItem(height: FileConstants.emptyItemHeight))

        let sortedSections = menuItem.defaultOptions.keys.sorted(by: { $0 < $1 })

        for section in sortedSections {
            let options = optionSectionsMap[section] ?? []
            sections.append(OrderOptions(DiffableArray(options), type: section))
        }

        sections.append(quantity)

        return sections
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let object = object as? EmptyItem {
            return HeaderImageSectionController(height: object.height, menuItem: menuItem)
        } else if let object = object as? OrderOptions {
            let orderCustomizationListSectionController = OrderOptionListSectionController(options: object)
            orderCustomizationListSectionController.selectOptionDelegate = self
            return orderCustomizationListSectionController
        } else if let object = object as? NSNumber {
            let quantitiyController = QuantitySectionController(quantity: object, itemType: menuItem.type)
            quantitiyController.delegate = self
            return quantitiyController
        }
        return ListSectionController()
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}

extension OrderDetailViewController: DidSelectOptionDelegate {

    func deselectOption(at index: Int, for type: OrderOption.OptionType) {
        var options = optionSectionsMap[type]!
        options[index] = options[index].copy(isSelected: false)
        optionSectionsMap[type] = options

        updateAddToCartPrice()

        listAdapter.performUpdates(animated: false, completion: nil)
    }

    func selectOption(at index: Int, for type: OrderOption.OptionType) {
        var options = optionSectionsMap[type]!
        let option = options[index]
        options[index] = option.copy(isSelected: !option.isSelected)
        optionSectionsMap[type] = options

        updateAddToCartPrice()

        listAdapter.performUpdates(animated: false, completion: nil)
    }

}

extension OrderDetailViewController: QuantitySelectionCollectionViewCellDelegate {

    func valueIncremented() {
        quantity = NSNumber(value: quantity.intValue + 1)
        updateAddToCartPrice()
        listAdapter.performUpdates(animated: false, completion: nil)
    }

    func valueDecremented() {
        if quantity.intValue > 1 {
            quantity = NSNumber(value: quantity.intValue - 1)
            updateAddToCartPrice()
            listAdapter.performUpdates(animated: false, completion: nil)
        }
    }

}
