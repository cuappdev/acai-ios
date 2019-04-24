//
//  TitleDetailListSectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/23/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import UIKit

class TitleDetailListSectionController: ListSectionController {

    var titleDetailItems: TitleDetailItems!

    init(titleDetailItems: TitleDetailItems) {
        self.titleDetailItems = titleDetailItems
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: TitleDetailCollectionViewCell.self, for: self, at: index) as! TitleDetailCollectionViewCell
        let titleDetailItem = titleDetailItems.items[index] as! TitleDetailItem
        cell.configure(for: titleDetailItem.title, detailText: titleDetailItem.detail, type: titleDetailItem.type)
        return cell
    }

    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let width = context.containerSize.width
        let cellHeight = 35
        let height = cellHeight*titleDetailItems.items.count
        return CGSize(width: width, height: CGFloat(cellHeight * height))

    }

    override func numberOfItems() -> Int {
        return titleDetailItems.items.count
    }

    override func didUpdate(to object: Any) {
        titleDetailItems = object as? TitleDetailItems
    }
    
}

