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
    
    var menuItem: MenuItem!
    var customizationOptions: [Any]!
    
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
        collectionViewListAdapter.dataSource = self as! ListAdapterDataSource
    }
}

extension MenuItemCustomizationViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        
        menuItem = Acai.testBowl
        
        customizationOptions = menuItem.customizationOptions
        var list = [] as [Any]
        list.append(Acai.menuItemHeaderImageIdentifier)
        list.append(menuItem)
        for o in customizationOptions {
            list.append(o)
        }
        list.append(Acai.menuItemButtonCollectionIdentifier)
        return list as! [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let object = object as? String, object == Acai.menuItemHeaderImageIdentifier {
            let headerImageSectionController = HeaderImageSectionController()
            headerImageSectionController.menuItem = menuItem
            return headerImageSectionController
        }
        else if let object = object as? MenuItem {
            let headerTextSectionController = HeaderTextSectionController()
            headerTextSectionController.menuItem = menuItem
            return headerTextSectionController
        }
        else if let object = object as? OrderCustomizationOption {
            return CustomizationOptionSectionController()
        }
        else {
            return ButtonSectionController()
        }
        //return CustomizationOptionSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}