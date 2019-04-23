//
//  String+Extension.swift
//  acai-ios
//
//  Created by Drew Dunne on 3/28/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

extension String {

    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: .usesLineFragmentOrigin,
            attributes: [.font: font],
            context: nil)
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: .usesLineFragmentOrigin,
            attributes: [.font: font],
            context: nil
        )
        return ceil(boundingBox.width)
    }

    func asPriceString() -> String {
        return String(format: "$%.2f", self)
    }

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

    // TODO: update requirements
    func isValidCardNumber() -> Bool {
        return true
    }

    // TODO: update requirements
    func isValidCardHolder() -> Bool {
        return true
    }

    // TODO: update requirements
    func isValidExpirationDate() -> Bool {
        return true
    }

    // TODO: update requirements
    func isValidCVC() -> Bool {
        return true
    }

}
