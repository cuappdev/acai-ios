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

        view.backgroundColor = .white
        
        DispatchQueue.main.async {
            self.showMenuItemCustomizationViewController()
        }
        
    }

//    func showMenuItemDetailViewController() {
//        let menuItemDetailViewController = MenuItemDetailViewController()
//        present(menuItemDetailViewController, animated: true, completion: nil)
//    }
    
    func showMenuItemCustomizationViewController() {
        let menuItemCustomizationViewController = MenuItemCustomizationViewController()
        present(menuItemCustomizationViewController, animated: true, completion: nil)
    }
    
    func showLoginViewController() {
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
    
    func showCheckoutViewController() {
        let checkoutViewController = CheckoutViewController()
        present(checkoutViewController, animated: true, completion: nil)
    }

}
