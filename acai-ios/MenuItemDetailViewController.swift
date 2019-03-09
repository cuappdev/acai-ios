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
    //var detailTextView: DetailTextView!
    var customizationViewController: MenuItemCustomizationViewController!
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
//        headerView = HeaderView()
//        headerView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(headerView)
//        headerView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview()
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.height.equalTo(330)
//        }
        
        customizationViewController = MenuItemCustomizationViewController()
        addChild(customizationViewController)
        view.addSubview(customizationViewController.view)
        customizationViewController.didMove(toParent: self)
        customizationViewController.view.translatesAutoresizingMaskIntoConstraints = false
        customizationViewController.view.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

