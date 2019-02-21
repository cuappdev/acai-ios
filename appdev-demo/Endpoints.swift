//
//  Endpoints.swift
//  appdev-demo
//
//  Created by Drew Dunne on 2/21/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation

// Example model (preferably written in another location)
struct User: Codable {
    let id: Int
}

// User added file for premade endpoints
extension Endpoint {
    static func user(from id: Int) -> Endpoint {
        let query = [URLQueryItem(name: "id", value: "\(id)")]
        return Endpoint(path: "/api/v1/user", queryItems: query)
    }
}
