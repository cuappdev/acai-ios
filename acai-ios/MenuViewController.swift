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

protocol MenuSelectionDelegate: class {
    func didSelect(_ item: MenuItem)
}

class MenuViewController: UIViewController {

    // MARK: Models
    var menu: [String: [MenuItem]] = [:]

    // MARK: IGListKit Vars
    var collectionView: UICollectionView!
    var listAdapter: ListAdapter!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        title = "Good Morning, Jamie ☀️"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.avenirNextMedium.withSize(24)
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.avenirNextMedium.withSize(16)
        ]

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)
        
        listAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        listAdapter.collectionView = collectionView
        listAdapter.dataSource = self
        
        setUpConstraints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        loadMenu()
    }

    private func loadMenu() {
        // TODO: get menu from endpoint

        menu = [
            "Bowls": [
                MenuItem(title: "Crunchy", price: 10.00, orderCustomizationOptions: [], image: UIImage(named: "acaiBowl")!),
                MenuItem(title: "Miami", price: 10.00, orderCustomizationOptions: [], image: UIImage(named: "acaiBowl")!)
            ],

            "Smoothies": [
            ],

            "Coffee": [
            ]
        ]

        listAdapter.performUpdates(animated: false, completion: nil)
    }
    
    // MARK: Constraint setup
    private func setUpConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// MARK: List adapter data source
extension MenuViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {

        let currentList = menu["Bowls"] ?? []

        return currentList
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let menuController = MenuListSectionController()
        menuController.delegate = self
        return menuController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension MenuViewController: MenuSelectionDelegate {

    func didSelect(_ item: MenuItem) {
        print("Selected \(item.title)")
    }
    
}
