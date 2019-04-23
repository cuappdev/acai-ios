//
//  CartItem.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

/// Temporary model for represneting a cart item. Bundles a menu item with the quantity of that item.
class CartItem: ListDiffable, NSCopying {

    /// Collection view tag for the next cart item to be created
    static var currentCartItemTag = 0

    var menuItem: MenuItem!
    var quantity: Int!
    var tag: Int

    init(menuItem: MenuItem, quantity: Int) {
        tag = CartItem.currentCartItemTag
        CartItem.currentCartItemTag += 1
        self.quantity = quantity
        self.menuItem = menuItem
    }

    init(menuItem: MenuItem, quantity: Int, tag: Int) {
        self.menuItem = menuItem
        self.quantity = quantity
        self.tag = tag
    }

    func diffIdentifier() -> NSObjectProtocol {
        return "\(menuItem.title)\(quantity)" as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CartItem else { return false }
        return quantity == object.quantity && menuItem.isEqual(toDiffableObject: object.menuItem)
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return CartItem(menuItem: menuItem, quantity: quantity, tag: tag)
    }
}

class CartItems: ListDiffable {

    let items: DiffableArray

    init(_ cartItems: DiffableArray) {
        self.items = cartItems
    }

    func getSubtotalPrice() -> Double {
        // TODO: update price
        return 9.99
    }

    func diffIdentifier() -> NSObjectProtocol {
        return "\(items.allItems())" as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CartItems else { return false }
        return items.isEqual(toDiffableObject: object.items)
    }

}

