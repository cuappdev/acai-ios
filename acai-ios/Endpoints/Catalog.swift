//
//  Catalog.swift
//  acai-ios
//
//  Created by Drew Dunne on 4/28/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import FutureNova

struct Catalog: Codable {

    /// Map from item ID to item struct
    let items: [String: Item]

    /// Map from modifier list ID to the list
    let modifierLists: [String: ModifierList]

    /// Map from tax ID to the tax struct
    let taxes: [String: Tax]

    enum CodingKeys: String, CodingKey {
        case items, taxes
        case modifierLists = "modifier_lists"
    }

    // MARK: classes

    struct Item: Codable {
        let name: String
        let taxIds: [String]
        let variations: [String: Variation]
        let modifierListIds: [String]

        enum CodingKeys: String, CodingKey {
            case name
            case taxIds = "tax_ids"
            case variations
            case modifierListIds = "modifier_list_ids"
        }
    }

    struct Variation: Codable {
        let name: String

        /// The base price of the item
        let price: Double
    }

    struct ModifierList: Codable {
        let name: String
        let modifiers: [String: ItemModifier]
    }

    struct ItemModifier: Codable {
        let name: String

        /// The price delta to apply
        let price: Double
    }

    struct Tax: Codable {
        let name: String
        let percentage: String
    }
}

extension Endpoint {

    /// Get the entire Menu catalog
    static func getCatalog() -> Endpoint {
        return Endpoint(path: "/catalog")
    }

}
