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
    
    // MARK: Data
    var baseOptions: [OrderCustomizationOption]!
    var bowlItem: BowlItem!
    var toppingOptions: [OrderCustomizationOption]!
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // hard code
        bowlItem = Acai.testBowl
        toppingOptions = bowlItem.toppingOptions
        baseOptions = bowlItem.baseOptions

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        listAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        listAdapter.collectionView = collectionView
        listAdapter.dataSource = self
    }
    
}

extension BowlOrderDetailViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [HeaderItem(title: "Choose your base"),
                OrderCustomizationOptions(options: baseOptions),
                HeaderItem(title: "Choose your toppings"),
                OrderCustomizationOptions(options: toppingOptions)]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
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

