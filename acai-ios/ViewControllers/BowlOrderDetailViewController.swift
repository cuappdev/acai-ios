//
//  BowlOrderDetailViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import SnapKit
import UIKit

protocol DidSelectOptionDelegate: class {
    func deselectOption(at index: Int)
    func selectOption(at index: Int, type: OrderCustomizationOptionType)
}

class BowlOrderDetailViewController: UIViewController {
    
    // MARK: View vars
    var addToCartActionTabView: ActionTabView!
    var backButton: UIButton!
    var backgroundGradient: CAGradientLayer!
    var bottomFillerRect: UIView!
    var collectionView: UICollectionView!
    var listAdapter: ListAdapter!
    var titleLabel: UILabel!
    
    // MARK: Gesture recognizers
    var addToCartTapGestureRecognizer: UITapGestureRecognizer!
    
    // MARK: Data
    var baseOptions: [OrderCustomizationOption]!
    var bowlItem: BowlItem!
    var toppingOptions: [OrderCustomizationOption]!
    
    // MARK: Constraint Constants
    let addToCartActionTabViewHeight = 55
    let backButtonLeadingOffset = 18
    let backButtonHeight = 15
    let backButtonWidth = 8.7
    let collectionViewTopOffset = 5
    let emptyItemHeight: CGFloat = 156
    let titleLabelTopOffset = 5.5
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        
        // hard code
        bowlItem = Acai.testBowl
        toppingOptions = bowlItem.toppingOptions
        baseOptions = bowlItem.baseOptions
        
        backgroundGradient = CAGradientLayer()
        backgroundGradient.colors = [UIColor.sunshine.cgColor, UIColor.butterscotch.cgColor]
        backgroundGradient.locations = [0, 1]
        backgroundGradient.startPoint = CGPoint(x: 0, y: 0)
        backgroundGradient.endPoint = CGPoint(x: 1, y: 0.5)
        backgroundGradient.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 3/5 * view.frame.height)
        view.layer.addSublayer(backgroundGradient)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.avenirNextBold.withSize(24)
        titleLabel.textColor = .white
        titleLabel.text = bowlItem.title
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(titleLabelTopOffset)
        }
        
        backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "backArrow")!, for: .normal)
        backButton.tintColor = .white
        backButton.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(popBowlOrderDetailViewController), for: .touchUpInside)
        view.addSubview(backButton)
        
        backButton.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.height.equalTo(backButtonHeight)
            make.leading.equalToSuperview().offset(backButtonLeadingOffset)
            make.width.equalTo(backButtonWidth)
        }
        
        addToCartActionTabView = ActionTabView(frame: .zero, title: "Add to Cart", price: bowlItem.price)
        view.addSubview(addToCartActionTabView)
        
        addToCartActionTabView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-addToCartActionTabViewHeight)
        }
        
        addToCartTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addToCart))
        addToCartActionTabView.addGestureRecognizer(addToCartTapGestureRecognizer)
        
        bottomFillerRect = UIView()
        bottomFillerRect.backgroundColor = .acaiBlack
        view.addSubview(bottomFillerRect)
        
        bottomFillerRect.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.bottom.equalTo(addToCartActionTabView.snp.top)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(collectionViewTopOffset)
        }
        
        listAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        listAdapter.collectionView = collectionView
        listAdapter.dataSource = self
        
    }
    
    @objc func addToCart() {
        print("addToCart pushed")
    }
    
    @objc func popBowlOrderDetailViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func updateAddToCartPrice() {
        let totalPrice = toppingOptions.reduce(0) { (result, option) -> Double in
            return result + (option.isSelected ? option.price : 0)
            } + baseOptions.reduce(0) { (result, option) -> Double in
                return result + (option.isSelected ? option.price : 0)
        }
        addToCartActionTabView.priceLabel.text = "$\(totalPrice)"
    }

}

extension BowlOrderDetailViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [
            EmptyItem(height: emptyItemHeight),
            HeaderItem(title: "Choose your base"),
            OrderCustomizationOptions(options: baseOptions),
            HeaderItem(title: "Choose your toppings"),
            OrderCustomizationOptions(options: toppingOptions),
            QuantityItem(quantity: 1)
        ]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let object = object as? EmptyItem {
            return BowlHeaderSectionController(height: object.height, bowlItem: bowlItem)
        }
        if let object = object as? HeaderItem {
            let headerListSectionController = HeaderListSectionController(title: object.title)
            return headerListSectionController
        }
        if let object = object as? OrderCustomizationOptions {
            let orderCustomizationListSectionController = OrderCustomizationListSectionController(options: object)
            orderCustomizationListSectionController.selectOptionDelegate = self
            return orderCustomizationListSectionController
        }
        if let object = object as? QuantityItem {
            return QuantitySectionController(quantity: object.quantity, object: bowlItem)
        }
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

extension BowlOrderDetailViewController: DidSelectOptionDelegate {
    
    func deselectOption(at index: Int) {
        baseOptions[index].isSelected = false
    }
    
    func selectOption(at index: Int, type: OrderCustomizationOptionType) {
        switch type {
        case .base:
            baseOptions[index] = baseOptions[index].copy() as! OrderCustomizationOption
            baseOptions[index].isSelected.toggle()
        case .topping:
            toppingOptions[index] = toppingOptions[index].copy() as! OrderCustomizationOption
            toppingOptions[index].isSelected.toggle()
        }
        updateAddToCartPrice()
        listAdapter.performUpdates(animated: false, completion: nil)
    }
    
}
