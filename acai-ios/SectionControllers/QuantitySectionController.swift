//
//  QuantitySectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import UIKit

class QuantitySectionController: ListSectionController {
    
    // MARK: Data
    var quantity: Int!
    var object: Any!
    
    // MARK: Constraint Constants
    let quantityCellHeightConstraint: CGFloat = 103
    
    init(quantity: Int, object: Any) {
        self.quantity = quantity
        self.object = object
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: quantityCellHeightConstraint)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: QuantitySelectionCollectionViewCell.self, for: self, at: index) as! QuantitySelectionCollectionViewCell
        cell.configure(object: object)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        if let object = object as? Int {
            quantity = object
        }
    }
    
}
