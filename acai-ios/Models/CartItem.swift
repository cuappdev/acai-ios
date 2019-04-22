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
class CartItem: ListDiffable {

    var menuItem: MenuItem = Acai.testBowl1
    var quantity: Int = 1
    var tag: Int

    init() {
        tag = CartItem.currentCartItemTag
        CartItem.currentCartItemTag += 1
    }

    /// Collection view tag for the next cart item to be created
    static var currentCartItemTag = 0

    func diffIdentifier() -> NSObjectProtocol {
        return "\(menuItem.title)\(quantity)" as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CartItem else { return false }
        return menuItem.title == object.menuItem.title && quantity == object.quantity
    }
}
