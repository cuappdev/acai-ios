//
//  PaymentViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

class PaymentViewController: UIViewController {

    // MARK: Constants
    private enum FileConstants {

        // MARK: Reuse identifiers
        static let inputCellReuseIdentifier = "inputCellReuseIdentifier"

        // MARK: Constraint constants
        static let inputViewHeight: CGFloat = 75
        static let inputViewTopOffset: CGFloat = 49
    }

    // MARK: Data
    var inputItems: [UserInputItem] = [
        UserInputItem(type: .firstName),
        UserInputItem(type: .lastName),
        UserInputItem(type: .phoneNumber),
        UserInputItem(type: .email),
        UserInputItem(type: .password)
    ]
    var email: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var password: String = ""
    var phoneNumber: String = ""
    var labelText: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
