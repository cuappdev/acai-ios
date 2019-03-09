//
//  HeaderTextSectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/7/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class HeaderTextSectionController: ListSectionController {
    var menuItem: MenuItem!
    
    override init() {
        super.init()
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext, let _ = menuItem else {
            return .zero
        }
        let width = context.containerSize.width
        let height = estimatedHeightForText(text: menuItem.getSelectedSubOptionsText()) + 26 + 56 + 20
        return CGSize(width: width, height: height)
    }
    
    private func estimatedHeightForText(text: String) -> CGFloat {
        guard let context = collectionContext, let _ = menuItem else {
            return 0
        }
        let size = CGSize(width: context.containerSize.width, height: 2000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: Acai.avenirNextMedium.withSize(16)], context: nil).height
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: DetailTextCollectionViewCell.self, for: self, at: index)
        if let cell = cell as? DetailTextCollectionViewCell {
            cell.menuItem = menuItem
            cell.setDetailText(menuItem: menuItem)
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let object = object as? MenuItem else { return }
        menuItem = object
    }
}
