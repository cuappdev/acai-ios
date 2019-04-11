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

    var currentMenuItem: MenuItem!

    weak var delegate: MenuSelectionDelegate?
    
    override func sizeForItem(at index: Int) -> CGSize {
        let menuListSectionHeight: CGFloat = 107
        return CGSize(width: collectionContext!.containerSize.width, height: menuListSectionHeight)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: MenuCollectionViewCell.self, for: self, at: index) as! MenuCollectionViewCell
        cell.imageView.image = currentMenuItem.image
        cell.titleLabel.text = currentMenuItem.title
        cell.ingredientsLabel.text = currentMenuItem.ingredientsString()
        return cell
    }
    
    override func didUpdate(to object: Any) {
        currentMenuItem = object as? MenuItem
    }

    override func didSelectItem(at index: Int) {
        delegate?.didSelect(currentMenuItem)
    }
}
