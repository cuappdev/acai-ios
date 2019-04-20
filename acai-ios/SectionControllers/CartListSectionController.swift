//
//  CartListSectionController.swift
//  acai-ios
//
//  Created by Jaewon Sim on 4/13/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class CartListSectionController: ListSectionController {
    
    var currentCartItem: CartItem!
    weak var delegate: CartSelectionDelegate?
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CartCollectionViewCell.self, for: self, at: index) as! CartCollectionViewCell
        let menuItem = currentCartItem.menuItem
        cell.imageView.image = menuItem.image
        cell.titleLabel.text = menuItem.title
        cell.ingredientsCollectionView.tag = currentCartItem.tag
        return cell
    }
    
    override func didUpdate(to object: Any) {
        currentCartItem = object as? CartItem
    }
    
    override func didSelectItem(at index: Int) {
    }
}
