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
    var itemType: MenuItem.ItemType!
    var quantity: NSNumber!

    // MARK: Delegate
    weak var delegate: QuantitySelectionCollectionViewCellDelegate?
    
    init(quantity: NSNumber, itemType: MenuItem.ItemType) {
        self.itemType = itemType
        self.quantity = quantity
    }
    
    override func sizeForItem(at index: Int) -> CGSize {

        guard let context = collectionContext else { return .zero }

        let quantityCellHeightConstraint: CGFloat = 103

        return CGSize(width: context.containerSize.width, height: quantityCellHeightConstraint)

    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {

        let cell = collectionContext!
            .dequeueReusableCell(of: QuantitySelectionCollectionViewCell.self, for: self, at: index)
            as! QuantitySelectionCollectionViewCell

        cell.configure(for: quantity, and: itemType)
        cell.delegate = delegate

        return cell
    }
    
    override func didUpdate(to object: Any) {
        if let object = object as? NSNumber {
            quantity = object
        }
    }
    
}
