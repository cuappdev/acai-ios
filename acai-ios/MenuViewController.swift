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

        formatNavigationBar()

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

        formatNavigationBar()
        loadMenu()
    }

    private func formatNavigationBar() {
        // TODO: coming back from detail view is still weird
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .compact)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.avenirNextMedium.withSize(24),
            .foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.avenirNextMedium.withSize(16),
            .foregroundColor: UIColor.black
        ]
    }

    private func loadMenu() {
        // TODO: get menu from endpoint

        menu = [
            "Bowls": [
                MenuItem(
                    title: "Crunchy",
                    price: 10.00,
                    optionsArrayObject: OrderCustomizationOptionsArray(optionsArray: []),
                    image: UIImage(named: "acaiBowl")!,
                    type: .bowl
                ),
                MenuItem(
                    title: "Miami",
                    price: 10.00,
                    optionsArrayObject: OrderCustomizationOptionsArray(optionsArray: []),
                    image: UIImage(named: "acaiBowl")!,
                    type: .bowl
                ),
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
        #if DEBUG
        print("Selected \(item.title)")
        #endif
        let order = OrderDetailViewController()
        order.menuItem = item
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(order, animated: true)
    }
    
}
