//
//  User.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/11/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

struct User: Codable {
    let createdAt: String
    let customerId: String
    let email: String
    let firstName: String
    let id: String
    let lastName: String
    let phoneNumber: String
    let session: UserSession
    let updatedAt: String
}

struct UserSession: Codable {
    let refreshToken: String
    let sessionExpiration: String
    let sessionToken: String
}
