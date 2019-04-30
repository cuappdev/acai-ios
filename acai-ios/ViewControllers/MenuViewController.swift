//
//  MenuViewController.swift
//  acai-ios
//
//  Created by Jaewon Sim on 3/13/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import AppDevSettings
import IGListKit
import SnapKit
import UIKit

protocol MenuSelectionDelegate: class {
    func didSelect(_ item: MenuItem)
}

class MenuViewController: UIViewController {

    // MARK: Models
    var menu: [MenuItem.ItemType: [MenuItem]] = [:]
    var selectedTab: MenuItem.ItemType!
    var cartItems: [CartItem] = []

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
        loadMenu()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        formatNavigationBar()
    }

    private func formatNavigationBar() {
        // TODO: coming back from detail view is still weird
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .compact)
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.tintColor = .coldGray
        navigationController?.navigationBar.barTintColor = UINavigationBar().barTintColor
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.avenirNextMedium.withSize(24),
            .foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.avenirNextMedium.withSize(20),
            .foregroundColor: UIColor.black
        ]

        // TODO: change settings icon
        let accountButton = UIBarButtonItem(image: UIImage(named: "about"), style: .plain, target: self, action: #selector(didPressSettings))
        accountButton.tintColor = .black
        let cartButton = UIBarButtonItem(image: UIImage(named: "cart"), style: .plain, target: self, action: #selector(cartButtonTapped))
        // TODO: change settings icon
        let settingsButton = UIBarButtonItem(image: UIImage(named: "about"), style: .plain, target: self, action: #selector(didPressSettings))
        navigationItem.rightBarButtonItems = [accountButton, cartButton, settingsButton]
    }

    @objc func cartButtonTapped() {
        let cartViewController = CartViewController()
        cartViewController.cartItems = CartItems(DiffableArray(cartItems))
        // Removes the "Good Morning, Name" from the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(cartViewController, animated: true)
    }

    @objc func accountButtonTapped() {
        let loginViewController = LoginViewController()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(loginViewController, animated: true)
    }

    private func loadMenu() {
        // TODO: get menu from endpoint
        menu = [
            .bowl: [
                Acai.testBowl1,
                Acai.testBowl2,
                Acai.testBowl3,
                Acai.testBowl4,
                Acai.testBowl5,
                Acai.testBowl6,
                Acai.testBowl7
            ],

            .smoothie: [
                Acai.testSmoothie1,
                Acai.testSmoothie2,
                Acai.testSmoothie3,
                Acai.testSmoothie4,
                Acai.testSmoothie5,
                Acai.testSmoothie6
            ],

            .drink: [
                Acai.drink1,
                Acai.coffee1,
                Acai.coffee2,
                Acai.coffee3,
                Acai.coffee4,
                Acai.coffee5,
                Acai.coffee6,
                Acai.coffee7,
                Acai.coffee8,
                Acai.coffee9,
                Acai.coffee10,
                Acai.coffee11,
                Acai.coffee12,
                Acai.coffee13,
                Acai.coffee14,
                Acai.coffee15,
                Acai.coffee16,
                Acai.coffee17
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

    @objc func didPressSettings() {
        let vc = UINavigationController(rootViewController: SettingsViewController(config: Constants.settings))
        present(vc, animated: true, completion: nil)
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
        order.delegate = self
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

extension MenuViewController: OrderDetailViewControllerDelegate {
    func addToCart(cartItem: CartItem) {
        cartItems.append(cartItem)
    }
}
