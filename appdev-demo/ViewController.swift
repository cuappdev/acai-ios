//
//  ViewController.swift
//  appdev-demo
//
//  Created by Drew Dunne on 2/19/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import FutureNova

class ViewController: UIViewController {

    let networking: Networking = URLSession.shared.request

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //somewhere else where we call loadUser
        loadUser(withID: 1).observe {[weak self] result in
            switch result {
            case .value(let user):
                self?.finishLogin(with: user)
            case .error(let error):
                assertionFailure(error.localizedDescription) //will only crash on development, not production
                // self?.presentError(with: error)
            }
        }
    }

    func finishLogin(with user: User) {
        // Do something
    }

    func loadUser(withID id: Int) -> Future<User> {
        return networking(Endpoint.user(from: id)).decode()
    }

}
