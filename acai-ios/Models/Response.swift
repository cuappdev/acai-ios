//
//  Response.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/13/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

struct Response<T: Codable>: Codable {

    let success: Bool
    let data: T?
    let error: String?

}
