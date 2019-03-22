//
//  MenuViewController.swift
//  acai-ios
//
//  Created by Jaewon Sim on 3/13/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit
import SnapKit

class MenuViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var adapter: ListAdapter!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(collectionView)
        
        adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        setUpConstraints()
    }
    
    // MARK: Constraint setup
    func setUpConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: List adapter data source
extension MenuViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [
            MenuItem(title: "Crunchy", price: 10.00, orderCustomizationOptions: [], image: UIImage(named: "acaiBowl")!),
            MenuItem(title: "Miami", price: 10.00, orderCustomizationOptions: [], image: UIImage(named: "acaiBowl")!)
        ]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return MenuListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
