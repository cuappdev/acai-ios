//
//  PriceListSectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import UIKit

class PriceListSectionController: ListSectionController {

    var cartItems: CartItems!

    init(cartItems: CartItems) {
        self.cartItems = cartItems
    }

    override func sizeForItem(at index: Int) -> CGSize {
        let height: CGFloat = 140
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: height)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: PriceCollectionViewCell.self, for: self, at: index) as! PriceCollectionViewCell
        cell.configure(for: cartItems.getSubtotalPrice())
        return cell
    }

    override func didUpdate(to object: Any) {
        if let object = object as? CartItems {
            cartItems = object
        }
    }

}
