//
//  String+Extension.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/11/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRE = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRE).evaluate(with: self)
    }

    func isValidName() -> Bool {
        let nameRE = "[a-zA-Z]+"
        return NSPredicate(format: "SELF MATCHES %@", nameRE).evaluate(with: self)
    }

    // TODO: update password requirements
    func isValidPassword() -> Bool {
        return self.count > 0
    }

    func isValidPhoneNumber() -> Bool {
        let phoneNumberRE = "^\\d{10,11}$|^\\d{0,1}\\(\\d{3}\\)\\d{3}-\\d{4}$|^\\d{1}-\\d{3}-\\d{3}-\\d{4}$|^\\d{3}-\\d{3}-\\d{4}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneNumberRE).evaluate(with: self)
    }
}
