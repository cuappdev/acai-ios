//
//  OrderConfirmationViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/23/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import UIKit

class OrderConfirmationViewController: UIViewController {

    // MARK: View vars
    private var returnToMenuActionTabView: ArrowLabelActionTabView!
    private var bottomFillerRect: UIView!
    private var collectionView: UICollectionView!
    private var textCollectionView: UICollectionView!

    /// "Main" list adapter for menu items
    private var listAdapter: ListAdapter!

    // MARK: Data
    private var cartItems: CartItems!
    private let textReuseIdentifier = "textReuseIdentifier"
    private var textItems: [TitleDetailItem]!

    // MARK: Gesture recognizers
    private var returnToMenuGestureRecognizer: UIGestureRecognizer!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        formatNavigationBar()

        loadCartItems()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)

        listAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        listAdapter.collectionView = collectionView
        listAdapter.dataSource = self

        returnToMenuActionTabView = ArrowLabelActionTabView(text: "Return to menu")
        returnToMenuActionTabView.subLabel.text = ""
        view.addSubview(returnToMenuActionTabView)

        returnToMenuGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(returnToMenu))
        returnToMenuActionTabView.addGestureRecognizer(returnToMenuGestureRecognizer)

        bottomFillerRect = UIView()
        bottomFillerRect.backgroundColor = .acaiBlack
        view.addSubview(bottomFillerRect)

        let textCollectionViewLayout = UICollectionViewFlowLayout()
        textCollectionView = UICollectionView(frame: .zero, collectionViewLayout: textCollectionViewLayout)
        textCollectionView.backgroundColor = .white
        textCollectionView.isScrollEnabled = false
        textCollectionView.register(TitleDetailCollectionViewCell.self, forCellWithReuseIdentifier: textReuseIdentifier)
        textCollectionView.delegate = self
        textCollectionView.dataSource = self
        textCollectionView.contentInset = UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 0)
        textCollectionView.layer.shadowColor = UIColor.black.cgColor
        textCollectionView.layer.shadowRadius = 16
        textCollectionView.layer.shadowOffset = CGSize(width: 0, height: 0)
        textCollectionView.layer.shadowOpacity = 0.2
        textCollectionView.clipsToBounds = false
        view.addSubview(textCollectionView)

        setUpConstraints()
    }

    @objc func returnToMenu() {
        // TODO: return to menu, use delegates to pop previous views
        navigationController?.popViewController(animated: true)
    }

    private func loadCartItems() {
        // TODO: network and delete hard code
        cartItems = CartItems(DiffableArray([
            Acai.testCart1,
            Acai.testCart2,
            Acai.testCart3
            ]))
        textItems = [
                TitleDetailItem(title: "Estimated wait time", detail: "15 min", type: .bold),
                TitleDetailItem(title: "Total", detail: cartItems.getTotalPrice().asPriceString(), type: .bold)
        ]
    }

    // MARK: Constraint setup
    private func setUpConstraints() {
        let checkoutActionTabViewHeight = 75
        let textCollectionViewHeight = 110

        returnToMenuActionTabView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(checkoutActionTabViewHeight)
        }

        bottomFillerRect.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }

        textCollectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(returnToMenuActionTabView.snp.top)
            make.height.equalTo(textCollectionViewHeight)
        }

        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(textCollectionView.snp.top)
        }
    }

    private func formatNavigationBar() {
        let navigationTitleLabel = UILabel()
        navigationTitleLabel.text = "Thank you for your order! 😊"
        navigationTitleLabel.font = UIFont.avenirNextMedium.withSize(24)
        navigationTitleLabel.sizeToFit()
        // TODO: prefersLargeTitles not working
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navigationTitleLabel)

        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .compact)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .navigationWhite
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.avenirNextMedium.withSize(24),
            .foregroundColor: UIColor.black
        ]
    }

}

// MARK: List adapter data source
extension OrderConfirmationViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var sections: [ListDiffable] = []
        sections.append(cartItems)
        return sections
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return CartListSectionController(cartItems: cartItems)
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }

}

extension OrderConfirmationViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = textCollectionView.dequeueReusableCell(withReuseIdentifier: textReuseIdentifier, for: indexPath) as! TitleDetailCollectionViewCell
        let textItem = textItems[indexPath.row]
        cell.configure(for: textItem)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight: CGFloat = 35
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }

}
