//
//  OrderHistoryViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import SnapKit
import UIKit

class OrderHistoryViewController: UIViewController {

    // MARK: setup collection view
    private var collectionView: UICollectionView!
    private var listAdapter: ListAdapter!

    // MARK: Data
    // TODO: update to [CartItem]
    var orders: [String]!

    // MARK: Constraint Constants
    private enum FileConstants {
        static let cellHeight: CGFloat = 50
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        formatNavigationBar()
        title = "History"

        getOrderHistory()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)

        listAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        listAdapter.collectionView = collectionView
        listAdapter.dataSource = self

        setupConstraints()
    }

    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }

    private func formatNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .compact)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.avenirNextBold.withSize(24),
            .foregroundColor: UIColor.white
        ]
    }

    func getOrderHistory() {
        orders = []
        // TODO: network and update order history
    }

}

extension OrderHistoryViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return orders as [ListDiffable]
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return OrderHistorySectionController(orders: orders)
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
