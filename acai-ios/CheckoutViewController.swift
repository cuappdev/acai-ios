//
//  CheckoutViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/12/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit
import IGListKit

class CheckoutViewController: UIViewController {
    
    var checkoutButton: UIButton!
    var taxLabel: UILabel!
    var taxAmountLabel: UILabel!
    var tipLabel: UILabel!
    var tipAmountLabel: UILabel!
    var subTotalLabel: UILabel!
    var subTotalAmountLabel: UILabel!
    var totalLabel: UILabel!
    var totalAmountLabel: UILabel!
    
    var checkoutMenuItems: [MenuItem]!
    var collectionView: UICollectionView!
    var collectionViewListAdapter: ListAdapter!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        checkoutButton = UIButton()
        checkoutButton.translatesAutoresizingMaskIntoConstraints = false
        checkoutButton.backgroundColor = .black
        checkoutButton.setTitleColor(.white, for: .normal)
        checkoutButton.setTitle("Checkout", for: .normal)
        checkoutButton.titleLabel?.font = Acai.avenirNextMedium.withSize(20)
        checkoutButton.addTarget(self, action: #selector(checkoutItems), for: .touchUpInside)
        view.addSubview(checkoutButton)
        checkoutButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-18)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        totalLabel = UILabel()
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.text = "Total: "
        totalLabel.font = Acai.avenirNextMedium.withSize(20)
        totalLabel.textColor = .black
        view.addSubview(totalLabel)
        totalLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(18)
            make.bottom.equalTo(checkoutButton.snp.top)
        }
        totalAmountLabel = UILabel()
        totalAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        totalAmountLabel.text = "$total"
        totalAmountLabel.font = Acai.avenirNextMedium.withSize(20)
        totalAmountLabel.textColor = .black
        view.addSubview(totalAmountLabel)
        totalAmountLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-18)
            make.bottom.equalTo(checkoutButton.snp.top)
        }
        taxLabel = UILabel()
        taxLabel.translatesAutoresizingMaskIntoConstraints = false
        taxLabel.text = "Tax: "
        taxLabel.font = Acai.avenirNextMedium.withSize(20)
        taxLabel.textColor = .black
        view.addSubview(taxLabel)
        taxLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(18)
            make.bottom.equalTo(totalLabel.snp.top)
        }
        taxAmountLabel = UILabel()
        taxAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        taxAmountLabel.text = "$tax"
        taxAmountLabel.font = Acai.avenirNextMedium.withSize(20)
        taxAmountLabel.textColor = .black
        view.addSubview(taxAmountLabel)
        taxAmountLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-18)
            make.bottom.equalTo(totalAmountLabel.snp.top)
        }
        tipLabel = UILabel()
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        tipLabel.text = "Tip: "
        tipLabel.font = Acai.avenirNextMedium.withSize(20)
        tipLabel.textColor = .black
        view.addSubview(tipLabel)
        tipLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(18)
            make.bottom.equalTo(taxLabel.snp.top)
        }
        tipAmountLabel = UILabel()
        tipAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        tipAmountLabel.text = "$tip"
        tipAmountLabel.font = Acai.avenirNextMedium.withSize(20)
        tipAmountLabel.textColor = .black
        view.addSubview(tipAmountLabel)
        tipAmountLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-18)
            make.bottom.equalTo(taxAmountLabel.snp.top)
        }
        subTotalLabel = UILabel()
        subTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        subTotalLabel.text = "Subtotal: "
        subTotalLabel.font = Acai.avenirNextMedium.withSize(20)
        subTotalLabel.textColor = .black
        view.addSubview(subTotalLabel)
        subTotalLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(18)
            make.bottom.equalTo(tipLabel.snp.top)
        }
        subTotalAmountLabel = UILabel()
        subTotalAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        subTotalAmountLabel.text = "$subtotal"
        subTotalAmountLabel.font = Acai.avenirNextMedium.withSize(20)
        subTotalAmountLabel.textColor = .black
        view.addSubview(subTotalAmountLabel)
        subTotalAmountLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-18)
            make.bottom.equalTo(tipAmountLabel.snp.top)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(subTotalLabel.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        collectionViewListAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        collectionViewListAdapter.collectionView = collectionView
        collectionViewListAdapter.dataSource = self
        
    }
    
    @objc func checkoutItems() {
        print("checkoutButton clicked")
    }

}

extension CheckoutViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        
        //hard code
        checkoutMenuItems = [Acai.miamiBowl, Acai.testBowl]
        let list = [Acai.menuItemCheckoutListIdentifier]
        
        return list as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let object = object as? String, object == Acai.menuItemCheckoutListIdentifier {
            let checkoutMenuItemSectionController = CheckoutMenuItemSectionController()
            checkoutMenuItemSectionController.checkoutMenuItems = checkoutMenuItems
            return checkoutMenuItemSectionController
        }
        else {
            return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
