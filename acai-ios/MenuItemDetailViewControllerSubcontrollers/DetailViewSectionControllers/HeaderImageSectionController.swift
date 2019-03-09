//
//  HeaderImageSectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/7/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class HeaderImageSectionController: ListSectionController {
    var menuItem: MenuItem!
    
    override init() {
        super.init()
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext, let option = menuItem else {
            return .zero
        }
        let width = context.containerSize.width
        return CGSize(width: width, height: 330)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: HeaderImageCollectionViewCell.self, for: self, at: index)
        if let cell = cell as? HeaderImageCollectionViewCell {
            cell.imageView.image = menuItem.image
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let object = object as? MenuItem else { return }
        menuItem = object
    }
}
