//
//  CartListSectionController.swift
//  acai-ios
//
//  Created by Jaewon Sim on 4/13/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import UIKit

class CartListSectionController: ListSectionController {

    var cartItems: CartItems!
    weak var delegate: CartSelectionDelegate?

    init(cartItems: CartItems) {
        self.cartItems = cartItems
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CartCollectionViewCell.self, for: self, at: index) as! CartCollectionViewCell
        let currentCartItem = cartItems.items[index] as! CartItem
        cell.configure(for: currentCartItem)
        return cell
    }

    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let width = context.containerSize.width
        let cartItem = cartItems.items[index] as! CartItem
        return CGSize(width: width, height: calculateCellHeight(for: cartItem))

    }

    override func numberOfItems() -> Int {
        return cartItems.items.count
    }

    override func didUpdate(to object: Any) {
        cartItems = object as? CartItems
    }

    override func didSelectItem(at index: Int) {
        
    }

    // MARK: - Private helpers
    private func calculateCellHeight(for cartItem: CartItem) -> CGFloat {
        let topPadding: CGFloat = 55
        let bottomPadding: CGFloat = 64
        let cartOptionCellHeight: CGFloat = 24
        let ingredients = cartItem.getIngredients()
        let ingredientsHeight = CGFloat(ingredients.count) * cartOptionCellHeight
        let cellHeight = topPadding + bottomPadding + ingredientsHeight
        let minCellHeight: CGFloat = 126
        return max(cellHeight, minCellHeight)
    }
}
