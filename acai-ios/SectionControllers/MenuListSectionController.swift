//
//  MenuListSectionController.swift
//  acai-ios
//
//  Created by Jaewon Sim on 3/18/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class MenuListSectionController: ListSectionController {

    var currentMenuItem: MenuItem?
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 107)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: MenuCollectionViewCell.self, for: self, at: index) as! MenuCollectionViewCell
        cell.imageView.image = currentMenuItem?.image
        cell.titleLabel.text = currentMenuItem?.title
        cell.ingredientsLabel.text = ["Granola", "Banana", "Kiwi", "Coconut Flaxseed"].joined(separator: ", ")
        return cell
    }
    
    override func didUpdate(to object: Any) {
        if let object = object as? MenuItem {
            currentMenuItem = object
        } else {
            return
        }
    }
}
