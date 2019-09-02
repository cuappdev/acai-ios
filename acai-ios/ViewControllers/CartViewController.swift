//
//  CartViewController.swift
//  acai-ios
//
//  Created by Jaewon Sim on 4/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import SnapKit
import UIKit

protocol CartSelectionDelegate: class {
    func didSelect(_ item: MenuItem)
}

class CartViewController: UIViewController {

    // MARK: View vars
    private var checkoutActionTabView: ArrowLabelActionTabView!
    private var bottomFillerRect: UIView!
    private var collectionView: UICollectionView!

    /// "Main" list adapter for menu items
    private var menuListAdapter: ListAdapter!

    // MARK: Data
    var cartItems: CartItems!
    //let cartOptionCvReuse = "cartOptionCvReuse"

    // MARK: Gesture recognizers
    private var checkoutGestureRecognizer: UIGestureRecognizer!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        formatNavigationBar()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)

        menuListAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        menuListAdapter.collectionView = collectionView
        menuListAdapter.dataSource = self

        checkoutActionTabView = ArrowLabelActionTabView(text: "Checkout")
        checkoutActionTabView.subLabel.text = cartItems.getTotalPrice().asPriceString()
        view.addSubview(checkoutActionTabView)

        checkoutGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(checkout))
        checkoutActionTabView.addGestureRecognizer(checkoutGestureRecognizer)

        bottomFillerRect = UIView()
        bottomFillerRect.backgroundColor = .acaiBlack
        view.addSubview(bottomFillerRect)

        setUpConstraints()
    }

    @objc func checkout() {
        // TODO: perform checkout, use UserDefaults to choose between login and payment views
//        let loginViewController = LoginViewController()
//        loginViewController.labelText = "To complete your order, you need to create an account or sign in."
//        navigationController?.pushViewController(loginViewController, animated: true)
        let paymentViewController = PaymentViewController()
        paymentViewController.cartItems = cartItems
        navigationController?.pushViewController(paymentViewController, animated: true)
    }

    // MARK: Constraint setup
    private func setUpConstraints() {
        let checkoutActionTabViewHeight = 75

        checkoutActionTabView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(checkoutActionTabViewHeight)
        }
        
        bottomFillerRect.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }

        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(checkoutActionTabView.snp.top)
        }
    }

    private func formatNavigationBar() {
        let navigationTitleLabel = UILabel()
        navigationTitleLabel.text = "My cart"
        navigationTitleLabel.font = UIFont.avenirNextMedium.withSize(24)
        navigationTitleLabel.sizeToFit()
        let navigationBarTitleItem = UIBarButtonItem(customView: navigationTitleLabel)
        let navigationBarBackButton = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .done, target: self, action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItems?.append(navigationBarTitleItem)
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "My Cart"
    }

    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }

}

// MARK: List adapter data source
extension CartViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var sections: [ListDiffable] = []
        sections.append(cartItems)
        sections.append(EmptyItem(height: 91))
        sections.append(EmptyItem(height: 140))
        return sections
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let object = object as? EmptyItem {
            if object.height == 91 {
                let centeredButtonListSectionController = CenteredButtonListSectionController(title: "Add another item")
                centeredButtonListSectionController.delegate = self
                return centeredButtonListSectionController
            } else {
                return PriceListSectionController(cartItems: cartItems)
            }
        } else {
            return CartListSectionController(cartItems: cartItems)
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension CartViewController: CenteredButtonCollectionViewCellDelegate {
    func popCenteredButtonSuperviewController() {
        navigationController?.popViewController(animated: true)
    }
}
