//
//  User.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/11/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation

struct User: Codable {
    let createdAt: String
    let customerId: String
    let email: String
    let firstName: String
    let id: String
    let lastName: String
    let phoneNumber: String
    let session: Session
    let updatedAt: String
}

struct Session: Codable {
    let refreshToken: String
    let sessionExpiration: Date
    let sessionToken: String
}
