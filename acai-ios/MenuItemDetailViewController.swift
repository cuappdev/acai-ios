//
//  MenuItemDetailViewController.swift
//  Chatty Cathy
//
//  Created by Artesia Ko on 2/18/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class MenuItemDetailViewController: UIViewController {
    
    // MARK: View vars
    var headerView: HeaderView!
    var detailTextView: DetailTextView!
    var customizationViewController: MenuItemCustomizationViewController!
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        headerView = HeaderView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        headerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(300)
        }

        detailTextView = DetailTextView()
        detailTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailTextView)
        detailTextView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        
        customizationViewController = MenuItemCustomizationViewController()
        addChild(customizationViewController)
    }

}
