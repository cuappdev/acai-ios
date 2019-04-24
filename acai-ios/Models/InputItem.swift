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
    case cardHolder = "Card Holder"
    case cardNumber = "Card Number"
    case cvc = "CVC"
    case email = "Email"
    case expirationDate = "Expiration Date"
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
        case .cardHolder:
            return "Chatty Cathy"
        case .cardNumber:
            return "1234123451234567"
        case .cvc:
            return "123"
        case .expirationDate:
            return "DD/MM"
        }
    }
}

struct UserInputItem {
    var type: InputType!
}
