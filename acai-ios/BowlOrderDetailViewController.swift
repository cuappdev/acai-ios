//
//  BowlOrderDetailViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

protocol DidSelectOptionDelegate: class {
    func deselectOption(at index: Int)
    func selectOption(at index: Int, type: OrderCustomizationOptionType)
}

class BowlOrderDetailViewController: UIViewController {
    
    // MARK: View vars
    var collectionView: UICollectionView!
    var listAdapter: ListAdapter!
    var addToCartActionTabView: ActionTabView!
    var fillerRect: UIView!
    
    // MARK: Data
    var baseOptions: [OrderCustomizationOption]!
    var bowlItem: BowlItem!
    var toppingOptions: [OrderCustomizationOption]!
    
    // MARK: Constraint Constants
    let addToCartActionTabViewHeight = 55
    let emptyItemHeight: CGFloat = 156
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .acaiOrange
        
        // hard code
        bowlItem = Acai.testBowl
        toppingOptions = bowlItem.toppingOptions
        baseOptions = bowlItem.baseOptions
        
        addToCartActionTabView = ActionTabView(frame: .zero, title: "Add to Cart", price: bowlItem.price)
        view.addSubview(addToCartActionTabView)
        
        addToCartActionTabView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-addToCartActionTabViewHeight)
        }
        
        fillerRect = UIView()
        fillerRect.backgroundColor = .acaiBlack
        view.addSubview(fillerRect)
        
        fillerRect.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.bottom.equalTo(addToCartActionTabView.snp.top)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        listAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        listAdapter.collectionView = collectionView
        listAdapter.dataSource = self
        
    }
    
    func updateAddToCartPrice() {
        addToCartActionTabView.priceLabel.text = "$\(bowlItem.getSelectedToppingsPrice() + baseOptions.reduce(0) { (result, option) -> Double in return result + (option.isSelected ? option.price : 0)})"
    }
    
}

extension BowlOrderDetailViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [EmptyItem(height: emptyItemHeight),
                HeaderItem(title: "Choose your base"),
                OrderCustomizationOptions(options: baseOptions),
                HeaderItem(title: "Choose your toppings"),
                OrderCustomizationOptions(options: toppingOptions)]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let object = object as? EmptyItem {
            return EmptySectionController(height: object.height)
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
        listAdapter.performUpdates(animated: false, completion: nil)
    }
    
}
