//
//  Endpoints.swift
//  appdev-demo
//
//  Created by Drew Dunne on 2/21/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation

extension Endpoint {

    private struct RegisterBody: Codable {
        let email: String
        let firstName: String
        let lastName: String
        let password: String
        let phoneNumber: String
    }

    /// The login endpoint to get a User
    static func login(email: String, password: String) -> Endpoint {
        let query = [
            URLQueryItem(name: "email", value: email),
            URLQueryItem(name: "password", value: password)
        ]

        return Endpoint(path: "/login", queryItems: query)
    }

    /// The registration endpoint to create a User
    static func register(firstName: String, lastName: String, email: String, password: String, phoneNumber: String) -> Endpoint {
        let body = RegisterBody(email: email, firstName: firstName, lastName: lastName, password: password, phoneNumber: phoneNumber)
        return Endpoint(path: "/register", body: body)
    }

}
