//
//  Endpoints.swift
//  appdev-demo
//
//  Created by Drew Dunne on 2/21/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import FutureNova

extension Endpoint {

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
        let body: [String: String] = [
            "email": email,
            "firstName": firstName,
            "lastName": lastName,
            "password": password,
            "phoneNumber": phoneNumber
        ]
        return Endpoint(path: "/api/v1/register/", body: body)
    }

}
