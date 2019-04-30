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
    let items: [String: CatalogItem]

    /// Map from modifier list ID to the list
    let modifierLists: [String: ModifierList]

    /// Map from tax ID to the tax struct
    let taxes: [String: OrderTax]

    enum CodingKeys: String, CodingKey {
        case items, taxes
        case modifierLists = "modifier_lists"
    }
}

struct CatalogItem: Codable {
    let name: String
    let taxIds: [String]
    let variations: [String: ItemVariation]
    let modifierListIds: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case taxIds = "tax_ids"
        case variations
        case modifierListIds = "modifier_list_ids"
    }
}

struct ItemVariation: Codable {
    let name: String

    /// The base price of the item
    let price: Int
}

struct ModifierList: Codable {
    let name: String
    let modifiers: [String: ItemModifier]
}

struct ItemModifier: Codable {
    let name: String

    /// The price delta to apply
    let price: Int
}

struct OrderTax: Codable {
    let name: String
    let percentage: String
}

extension Endpoint {

    /// Get the entire Menu catalog
    static func getCatalog() -> Endpoint {
        return Endpoint(path: "/catalog")
    }

}
