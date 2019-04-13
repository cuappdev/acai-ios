//
//  InputItem.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/12/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import UIKit

enum InputType: String {
    case email = "Email"
    case firstName = "First Name"
    case lastName = "Last Name"
    case password = "Password"
    case phoneNumber = "Phone Number"

    func placeholder() -> String {
        switch self {
        case .email:
            return "cathy@chattycathy.com"
        case .firstName:
            return "Chatty"
        case .lastName:
            return "Cathy"
        case .password:
            return "••••••••••••••"
        case .phoneNumber:
            return "8005554444"
        }
    }
}

class InputItem {

    var type: InputType!

    init(type: InputType) {
        self.type = type
    }

}
