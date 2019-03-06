//
//  MenuItemCustomizationViewController.swift
//  Chatty Cathy
//
//  Created by Artesia Ko on 2/18/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class MenuItemCustomizationViewController: UIViewController {

    // MARK: View vars
    var collectionView: UICollectionView!
    var collectionViewListAdapter: ListAdapter!
    var addButton: UIButton!
    var resetButton: UIButton!
    
    var customizationOptions: [CustomizationOption]!
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-18)
        }
        
        collectionViewListAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        collectionViewListAdapter.collectionView = collectionView
        collectionViewListAdapter.dataSource = self as! ListAdapterDataSource

        resetButton = UIButton(type: .system)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setTitle("Reset Options", for: .normal)
        resetButton.setTitleColor(Acai.lightGray, for: .normal)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        view.addSubview(resetButton)
        resetButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        addButton = UIButton(type: .system)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Add Item", for: .normal)
        addButton.setTitleColor(Acai.orange, for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        view.addSubview(addButton)
        addButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(resetButton.snp.top).offset(-26)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func addItem() {
        
    }
    
    @objc func resetOptions() {
        
    }
}

extension MenuItemCustomizationViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        
        //hard code for testing
        let acai = CustomizationOptionSubOption(title: "Acai", isSelected: true)
        let pineapple = CustomizationOptionSubOption(title: "Pineapple", isSelected: true)
        let banana = CustomizationOptionSubOption(title: "Banana", isSelected: true)
        let strawberry = CustomizationOptionSubOption(title: "Strawberry", isSelected: true)
        let granola = CustomizationOptionSubOption(title: "Granola", isSelected: true)
        let coconutChips = CustomizationOptionSubOption(title: "Coconut Chips", isSelected: true)
        let nutFree = CustomizationOptionSubOption(title: "Nut Free", isSelected: true)
        
        let o1 = CustomizationOption(title: "Base Options", options: [acai])
        let o2 = CustomizationOption(title: "Fruit", options: [pineapple, banana, strawberry])
        let o3 = CustomizationOption(title: "Toppings", options: [granola, coconutChips])
        let o4 = CustomizationOption(title: "Allergens", options: [nutFree])
        
        customizationOptions = [o1, o2, o3, o4]
        return customizationOptions as! [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return CustomizationOptionSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    
}
