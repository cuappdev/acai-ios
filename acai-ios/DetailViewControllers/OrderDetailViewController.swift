//
//  OrderDetailViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit
import SnapKit

protocol DidSelectOptionDelegate: class {
    func deselectOption(at index: Int)
    func selectOption(at index: Int, type: OrderCustomizationOptionType)
}

class OrderDetailViewController: UIViewController {
    
    // MARK: View vars
    var addToCartActionTabView: ActionTabView!
    var backgroundGradient: CAGradientLayer!
    var bottomFillerRect: UIView!
    var collectionView: UICollectionView!
    var listAdapter: ListAdapter!

    // MARK: Gesture recognizers
    var addToCartTapGestureRecognizer: UITapGestureRecognizer!
    
    // MARK: Data
    var menuItem: MenuItem!
    var optionsArrayObject: OrderCustomizationOptionsArray!
    
    // MARK: Constraint Constants
    let addToCartActionTabViewHeight = 55
    let backgroundGradientScaleHeight: CGFloat = 0.6
    let emptyItemHeight: CGFloat = 156
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .compact)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.avenirNextBold.withSize(24),
            .foregroundColor: UIColor.white
        ]

        // TODO: change to endpoint request data
        menuItem = Acai.testBowl
        title = menuItem.title
        optionsArrayObject = menuItem.optionsArrayObject
        
        backgroundGradient = CAGradientLayer()
        backgroundGradient.colors = [UIColor.sunshine.cgColor, UIColor.butterscotch.cgColor]
        backgroundGradient.locations = [0, 1]
        backgroundGradient.startPoint = CGPoint(x: 0, y: 0)
        backgroundGradient.endPoint = CGPoint(x: 1, y: 0.5)
        backgroundGradient.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: backgroundGradientScaleHeight * view.frame.height)
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
    
    private func setupConstraints() {
        addToCartActionTabView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-addToCartActionTabViewHeight)
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
        print("addToCart pushed")
    }

    func updateAddToCartPrice() {
        let totalPrice = optionsArrayObject.optionsArray.reduce(0) { (result, optionsObject) -> Double in
            return result + optionsObject.options.reduce(0, { (result, option) -> Double in
                return result + (option.isSelected ? option.price : 0)
            })
        }
        addToCartActionTabView.priceLabel.text = "$\(totalPrice)"
    }

}

extension OrderDetailViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var sections: [ListDiffable] = []
        sections.append(EmptyItem(height: emptyItemHeight))
        for optionsObject in optionsArrayObject.optionsArray {
            sections.append(optionsObject)
        }
        sections.append(QuantityItem(quantity: 1))
        return sections
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let object = object as? EmptyItem {
            return HeaderImageSectionController(height: object.height, menuItem: menuItem)
        } else if let object = object as? OrderCustomizationOptions {
            let orderCustomizationListSectionController = OrderCustomizationListSectionController(options: object)
            orderCustomizationListSectionController.selectOptionDelegate = self
            return orderCustomizationListSectionController
        } else if let object = object as? QuantityItem {
            return QuantitySectionController(quantity: object.quantity, menuItem: menuItem)
        }
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

extension OrderDetailViewController: DidSelectOptionDelegate {
    
    func deselectOption(at index: Int) {
        optionsArrayObject.optionsArray.filter({ $0.type == .base || $0.type == .size })[0].options[index].isSelected = false
//        baseOptions[index].isSelected = false
    }
    
    func selectOption(at index: Int, type: OrderCustomizationOptionType) {
        switch type {
        case .base, .size:
            optionsArrayObject.optionsArray.filter({ $0.type == .base || $0.type == .size })[0].options[index] = optionsArrayObject.optionsArray.filter({ $0.type == .base || $0.type == .size })[0].options[index].copy() as! OrderCustomizationOption
             optionsArrayObject.optionsArray.filter({ $0.type == .base || $0.type == .size })[0].options[index].isSelected.toggle()
//            baseOptions[index] = baseOptions[index].copy() as! OrderCustomizationOption
//            baseOptions[index].isSelected.toggle()
        case .topping:
            optionsArrayObject.optionsArray.filter({ $0.type == .topping })[0].options[index] = optionsArrayObject.optionsArray.filter({ $0.type == .topping })[0].options[index].copy() as! OrderCustomizationOption
            optionsArrayObject.optionsArray.filter({ $0.type == .topping })[0].options[index].isSelected.toggle()
//            toppingOptions[index] = toppingOptions[index].copy() as! OrderCustomizationOption
//            toppingOptions[index].isSelected.toggle()
        }
        updateAddToCartPrice()
        listAdapter.performUpdates(animated: false, completion: nil)
    }
    
}
