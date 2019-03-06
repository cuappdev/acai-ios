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
    var dismissButton: UIButton!
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
            make.height.equalTo(330)
        }

        detailTextView = DetailTextView()
        detailTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailTextView)
        detailTextView.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-18)
        }
        
        customizationViewController = MenuItemCustomizationViewController()
        addChild(customizationViewController)
        view.addSubview(customizationViewController.view)
        customizationViewController.didMove(toParent: self)
        customizationViewController.view.translatesAutoresizingMaskIntoConstraints = false
        customizationViewController.view.snp.makeConstraints { (make) in
            make.top.equalTo(detailTextView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        dismissButton = UIButton(type: .system)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.backgroundColor = Acai.orange
        //dismissButton.setImage(UIImage(), for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissMenuItemDetailViewController), for: .touchUpInside)
        view.addSubview(dismissButton)
        dismissButton.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(6)
            make.leading.equalToSuperview().offset(18)
            make.height.equalTo(23)
            make.width.equalTo(23)
        }
    }
    
    @objc func dismissMenuItemDetailViewController() {
        dismiss(animated: true, completion: nil)
    }
}
