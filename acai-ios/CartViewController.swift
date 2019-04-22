//
//  CartViewController.swift
//  acai-ios
//
//  Created by Jaewon Sim on 4/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit
import SnapKit

protocol CartSelectionDelegate: class {
    func didSelect(_ item: MenuItem)
}

class CartViewController: UIViewController {
    
    // MARK: IGListKit vars
    var collectionView: UICollectionView!
    /// "Main" list adapter for menu items
    var menuListAdapter: ListAdapter!
    
    // MARK: Models
    var cartItems: [CartItem] = []
    
    // MARK: Reuse identifiers
    let cartOptionCvReuse = "cartOptionCvReuse"
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "My cart"
        // TODO: Format navigation bar
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        collectionView.register(CartOptionCollectionViewCell.self, forCellWithReuseIdentifier: cartOptionCvReuse)
        view.addSubview(collectionView)
        
        menuListAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        menuListAdapter.collectionView = collectionView
        menuListAdapter.dataSource = self
        
        setUpConstraints()
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
extension CartViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return cartItems
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let cartController = CartListSectionController()
        return cartController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

// MARK: Collection view delegate
extension CartViewController: UICollectionViewDelegate {
    
}

// MARK: Collection view data source
extension CartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartItems[collectionView.tag].menuItem.defaultOptions[.topping]?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cartOptionCvReuse, for: indexPath) as! CartOptionCollectionViewCell
        let option = cartItems[collectionView.tag].menuItem.defaultOptions[.topping]?[indexPath.item]
        cell.optionTitleLabel.text = option?.title
        cell.additionalPriceLabel.text  = option?.price.asPriceString()
        return cell
    }
}
