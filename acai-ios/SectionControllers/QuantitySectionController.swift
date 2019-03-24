//
//  QuantitySectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class QuantitySectionController: ListSectionController {
    
    // MARK: Data
    var menuItem: MenuItem!
    var quantity: Int!
    
    // MARK: Constraint Constants
    let quantityCellHeightConstraint: CGFloat = 103
    
    init(quantity: Int, menuItem: MenuItem) {
        self.menuItem = menuItem
        self.quantity = quantity
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: quantityCellHeightConstraint)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: QuantitySelectionCollectionViewCell.self, for: self, at: index) as! QuantitySelectionCollectionViewCell
        cell.configure(menuItem: menuItem)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        if let object = object as? Int {
            quantity = object
        }
    }
    
}
