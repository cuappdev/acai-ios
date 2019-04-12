//
//  User.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/11/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation

struct User: Codable {
    let email: String
    let firstName: String
    let lastName: String
    let password: String
    let phoneNumber: String
}
