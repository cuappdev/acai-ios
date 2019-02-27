//
//  Endpoints.swift
//  appdev-demo
//
//  Created by Drew Dunne on 2/21/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import FutureNova

// User added file for premade endpoints
extension Endpoint {

    /// The login endpoint
    static func login() -> Endpoint {
        query = [:]
        return Endpoint(path: "/login", queryItems: query)
    }

}
