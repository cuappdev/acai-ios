//
//  Double+Extensions.swift
//  acai-ios
//
//  Created by Drew Dunne on 3/27/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation

extension Double {

    func asPriceString() -> String {
        return String(format: "$%.2f", self)
    }

}
