//
//  ViewController.swift
//  Chatty Cathy
//
//  Created by Drew Dunne on 2/13/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        title = "Good Morning, Drew"

        DispatchQueue.main.async {
            self.showBowlCustomizationViewController()
        }
    }
    
    func showLoginViewController() {
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
    
    func showBowlCustomizationViewController() {
        let orderDetailViewController = BowlOrderDetailViewController()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(orderDetailViewController, animated: true)
    }

}
