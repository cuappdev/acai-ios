//
//  String+Extension.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/11/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation

extension String {

    func asPriceString() -> String {
        return String(format: "$%.2f", self)
    }

    func isValidEmail() -> Bool {
        let emailRE = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRE).evaluate(with: self)
    }

    // TODO: update name requirements
    func isValidName() -> Bool {
        return self.count > 0
    }

    // TODO: update password requirements
    func isValidPassword() -> Bool {
        return self.count > 0
    }

    func isValidPhoneNumber() -> Bool {
        let phoneNumberRE = "^\\d{3}\\d{3}\\d{4}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneNumberRE).evaluate(with: self)
    }
}
