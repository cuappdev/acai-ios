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
        let pricePerItem = getIngredients().reduce(0) { (result, option) -> Double in
            return result + option.price
        }
        return pricePerItem * Double(quantity)
    }

    func getIngredients() -> [OrderOption] {
        let ingredients: [OrderOption] = selectedOptions.flatMap { (_, orderOptions) -> [OrderOption] in
            return orderOptions
        }
        return ingredients
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

    func getTaxPrice() -> Double {
        // TODO: check tax amount
        let taxPercent = 0.08
        return taxPercent * getSubtotalPrice()
    }

    func getTotalPrice() -> Double {
        return getSubtotalPrice() + getTaxPrice()
    }

    func diffIdentifier() -> NSObjectProtocol {
        return "\(items.allItems())" as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? CartItems else { return false }
        return items.isEqual(toDiffableObject: object.items)
    }

}
