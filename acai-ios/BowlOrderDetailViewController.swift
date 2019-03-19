//
//  BowlOrderDetailViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class BowlOrderDetailViewController: UIViewController {
    // MARK: View vars
    var collectionView: UICollectionView!
    var collectionViewListAdapter: ListAdapter!
    
    var bowlItem: BowlItem!
    var baseOptions: [CustomizationOption]!
    var toppingOptions: [CustomizationOption]!
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        collectionViewListAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        collectionViewListAdapter.collectionView = collectionView
        collectionViewListAdapter.dataSource = self
    }
}

extension BowlOrderDetailViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        
        bowlItem = Acai.testBowl
        
        toppingOptions = bowlItem.toppingOptions
        baseOptions = bowlItem.baseOptions
        
        var list = [] as [ListDiffable]
        list.append("Choose your base" as ListDiffable)
        list.append(Acai.bowlOrderBaseOptionsIdentifier as ListDiffable)
        list.append("Choose your toppings" as ListDiffable)
        list.append(Acai.bowlOrderToppingOptionsIdentifier as ListDiffable)
        return list
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let orderCustomizationListSectionController = OrderCustomizationListSectionController()
        if let object = object as? String, object == Acai.bowlOrderBaseOptionsIdentifier {
            orderCustomizationListSectionController.options = bowlItem.baseOptions
            orderCustomizationListSectionController.deselectOptionDelegate = self
            orderCustomizationListSectionController.selectOptionDelegate = self
        }
        else if let object = object as? String, object == Acai.bowlOrderToppingOptionsIdentifier {
            orderCustomizationListSectionController.options = bowlItem.toppingOptions
            orderCustomizationListSectionController.selectOptionDelegate = self
        }
        else if let object = object as? String {
            let headerListSectionController = HeaderListSectionController()
            headerListSectionController.title = object
            return headerListSectionController
        }
        return orderCustomizationListSectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

protocol DidDeselectOption: class {
    func deselectOption(at index: Int)
}

protocol DidSelectOption: class {
    func selectOption(at index: Int, type: CustomizationOptionType)
}

extension BowlOrderDetailViewController: DidDeselectOption, DidSelectOption {
    
    func deselectOption(at index: Int) {
        baseOptions[index].isSelected = false
        collectionView.reloadData()
    }
    
    func selectOption(at index: Int, type: CustomizationOptionType) {
        switch type {
        case .base:
            baseOptions[index].isSelected = !baseOptions[index].isSelected
        case .topping:
            toppingOptions[index].isSelected = !toppingOptions[index].isSelected
        }
        collectionView.reloadData()
    }
    
}

