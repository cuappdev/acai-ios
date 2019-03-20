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
            self.showBowlCustomizationViewController()
        }
    }
    
    func showLoginViewController() {
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: nil)
    }
    
    func showBowlCustomizationViewController() {
        let orderDetailViewController = BowlOrderDetailViewController()
        present(orderDetailViewController, animated: true, completion: nil)
    }

}
