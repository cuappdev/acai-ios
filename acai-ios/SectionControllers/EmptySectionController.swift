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
    
    init(height: CGFloat) {
        self.height = height
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: height)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: UICollectionViewCell.self, for: self, at: index)
        return cell
    }
    
    override func didUpdate(to object: Any) {
        if let object = object as? EmptyItem {
            height = object.height
        }
    }
}
