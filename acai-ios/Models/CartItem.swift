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
    var selectedOptions: [OrderOption.OptionType: [OrderOption]]!

    init(menuItem: MenuItem, quantity: Int, selectedOptions: [OrderOption.OptionType: [OrderOption]]) {
        tag = CartItem.currentCartItemTag
        CartItem.currentCartItemTag += 1
        self.quantity = quantity
        self.menuItem = menuItem
        self.selectedOptions = selectedOptions
    }

    init(menuItem: MenuItem, quantity: Int, selectedOptions: [OrderOption.OptionType: [OrderOption]], tag: Int) {
        self.menuItem = menuItem
        self.quantity = quantity
        self.selectedOptions = selectedOptions
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
        return CartItem(menuItem: menuItem, quantity: quantity, selectedOptions: selectedOptions, tag: tag)
    }

    func getPrice() -> Double {
        // TODO: create array for selected options
        let pricePerItem = selectedOptions.reduce(0, { (result, options) -> Double in
            result + options.value.reduce(0, { (result, option) -> Double in
                result + (option.isSelected ? option.price : 0)
            })
        })
        return pricePerItem * Double(quantity)
    }
}

class CartItems: ListDiffable {

    let items: DiffableArray

    init(_ cartItems: DiffableArray) {
        self.items = cartItems
    }

    func getSubtotalPrice() -> Double {
        return items.allItems().reduce(0, { (result, item) -> Double in
            result + (item as! CartItem).getPrice()
        })
    }

    func diffIdentifier() -> NSObjectProtocol {
        return "\(items.allItems())" as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CartItems else { return false }
        return items.isEqual(toDiffableObject: object.items)
    }

}
