//
//  CheckoutMenuItemSectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/12/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class CheckoutMenuItemSectionController: ListSectionController {
    var checkoutMenuItems: [MenuItem]!
    override init() {
        super.init()
    }
    
    override func numberOfItems() -> Int {
        return checkoutMenuItems.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext, let option = checkoutMenuItems else {
            return .zero
        }
        let width = context.containerSize.width
        return CGSize(width: width, height: 50)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CheckoutMenuItemCollectionViewCell.self, for: self, at: index)
        let checkoutMenuItem = checkoutMenuItems[index]
        if let cell = cell as? CheckoutMenuItemCollectionViewCell {
            cell.menuItemTitleLabel.text = checkoutMenuItem.title
            cell.menuItemPriceLabel.text = "$\(checkoutMenuItem.basePrice + checkoutMenuItem.getSelectedSubOptionsPrice())"
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let object = object as? [MenuItem] else { return }
        checkoutMenuItems = object
    }
}
