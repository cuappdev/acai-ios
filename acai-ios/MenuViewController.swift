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
    var menu: [MenuItem.ItemType: [MenuItem]] = [:]
    var selectedTab: MenuItem.ItemType!

    // MARK: IGListKit Vars
    var collectionView: UICollectionView!
    var listAdapter: ListAdapter!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        // TODO: change based on time of day
        title = "Good Morning, Jamie ☀️"

        selectedTab = .bowl

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

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
        navigationController?.navigationBar.barTintColor = UINavigationBar().barTintColor
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.avenirNextMedium.withSize(24),
            .foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.avenirNextMedium.withSize(24),
            .foregroundColor: UIColor.black
        ]
    }

    private func loadMenu() {
        // TODO: get menu from endpoint
        menu = [
            .bowl: [
                Acai.testBowl1,
                Acai.testBowl2,
                Acai.testBowl3,
                Acai.testBowl4,
                Acai.testBowl5
            ],

            .smoothie: [
            ],

            .drink: [
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

        var currentList: [ListDiffable] = menu[selectedTab] ?? []

        let selected = Constants.menuTabs.firstIndex(of: selectedTab)!

        currentList.insert(NSNumber(value: selected), at: 0)

        return currentList

    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is NSNumber {
            let menuTabController = MenuTabListSectionController()
            menuTabController.delegate = self
            return menuTabController
        } else if object is MenuItem {
            let menuController = MenuListSectionController()
            menuController.delegate = self
            return menuController
        }
        return ListSectionController()
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
        // Leave commented until decide with design what flow to use
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        let nc = UINavigationController(rootViewController: order)
        nc.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.present(nc, animated: true, completion: nil)
//        navigationController?.pushViewController(order, animated: true)
    }
    
}

extension MenuViewController: MenuTabDelegate {

    func selectedTabDidChange(to tab: NSNumber) {
        selectedTab = Constants.menuTabs[tab.intValue]
        listAdapter.performUpdates(animated: false, completion: nil)
    }

}
