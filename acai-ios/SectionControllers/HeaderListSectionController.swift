//
//  HeaderSectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/18/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class HeaderListSectionController: ListSectionController {
    var title: String!
    
    override init() {
        super.init()
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: 43)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: OptionHeaderCollectionViewCell.self, for: self, at: index)
        if let cell = cell as? OptionHeaderCollectionViewCell {
            cell.titleLabel.text = title
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let object = object as? String else { return }
        title = object
    }
}
