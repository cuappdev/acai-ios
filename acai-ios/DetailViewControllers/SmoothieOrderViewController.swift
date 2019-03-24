//
//  SmoothieOrderViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/24/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import SnapKit
import UIKit

class SmoothieOrderViewController: UIViewController {

    // MARK: View vars
    var addToCartActionTabView: ActionTabView!
    var backgroundGradient: CAGradientLayer!
    var bottomFillerRect: UIView!
    var collectionView: UICollectionView!
    var listAdapter: ListAdapter!
    
    // MARK: Gesture recognizers
    var addToCartTapGestureRecognizer: UITapGestureRecognizer!
    
    // MARK: Data
    var smoothieItem: MenuItem!
    var ingredientOptions: [OrderCustomizationOption]!
    var sizeOptions: [OrderCustomizationOption]!
    
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
        smoothieItem = Acai.testSmoothie
        title = smoothieItem.title
        sizeOptions = smoothieItem.options.filter({$0.type == .size})
        ingredientOptions = smoothieItem.options.filter({$0.type == .topping})
        
        backgroundGradient = CAGradientLayer()
        backgroundGradient.colors = [UIColor.sunshine.cgColor, UIColor.butterscotch.cgColor]
        backgroundGradient.locations = [0, 1]
        backgroundGradient.startPoint = CGPoint(x: 0, y: 0)
        backgroundGradient.endPoint = CGPoint(x: 1, y: 0.5)
        backgroundGradient.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: backgroundGradientScaleHeight * view.frame.height)
        view.layer.addSublayer(backgroundGradient)
        
        addToCartActionTabView = ActionTabView(frame: .zero, title: "Add to Cart", price: smoothieItem.price)
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
        let totalPrice = ingredientOptions.reduce(0) { (result, option) -> Double in
            return result + (option.isSelected ? option.price : 0)
            } + sizeOptions.reduce(0) { (result, option) -> Double in
                return result + (option.isSelected ? option.price : 0)
        }
        addToCartActionTabView.priceLabel.text = "$\(totalPrice)"
    }
    
}

extension SmoothieOrderViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [
            EmptyItem(height: emptyItemHeight),
            OrderCustomizationOptions(options: sizeOptions, type: .size),
            OrderCustomizationOptions(options: ingredientOptions, type: .topping),
            QuantityItem(quantity: 1)
        ]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let object = object as? EmptyItem {
            return HeaderImageSectionController(height: object.height, menuItem: smoothieItem)
        }
        if let object = object as? OrderCustomizationOptions {
            let orderCustomizationListSectionController = OrderCustomizationListSectionController(options: object)
            orderCustomizationListSectionController.selectOptionDelegate = self
            return orderCustomizationListSectionController
        }
        if let object = object as? QuantityItem {
            return QuantitySectionController(quantity: object.quantity, menuItem: smoothieItem)
        }
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

extension SmoothieOrderViewController: DidSelectOptionDelegate {
    
    func deselectOption(at index: Int) {
        sizeOptions[index].isSelected = false
    }
    
    func selectOption(at index: Int, type: OrderCustomizationOptionType) {
        switch type {
        case .size:
            sizeOptions[index] = sizeOptions[index].copy() as! OrderCustomizationOption
            sizeOptions[index].isSelected.toggle()
        case .topping:
            ingredientOptions[index] = ingredientOptions[index].copy() as! OrderCustomizationOption
            ingredientOptions[index].isSelected.toggle()
        case .base:
            return
        }
        updateAddToCartPrice()
        listAdapter.performUpdates(animated: false, completion: nil)
    }

}
