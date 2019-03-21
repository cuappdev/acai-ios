//
//  EmptySectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/20/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class EmptySectionController: ListSectionController {
    
    var height: CGFloat!
    var bowlItem: BowlItem
    
    init(height: CGFloat, bowlItem: BowlItem) {
        self.height = height
        self.bowlItem = bowlItem
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: BowlHeaderCollectionViewCell.self, for: self, at: index) as! BowlHeaderCollectionViewCell
        cell.configure(for: bowlItem)
        cell.clipsToBounds = true
        return cell
    }
    
    override func didUpdate(to object: Any) {
        if let object = object as? EmptyItem {
            height = object.height
        }
    }
}
