//
//  CustomizationOptionSectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class CustomizationOptionSectionController: ListSectionController {

    var customizationOptions: [OrderCustomizationOption]!
    
    override init() {
        super.init()
    }
    
    override func numberOfItems() -> Int {
        return customizationOptions.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext, let options = customizationOptions else {
            return .zero
        }
        let width = context.containerSize.width
        return CGSize(width: width, height: 50)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CustomizationOptionCollectionViewCell.self, for: self, at: index)
        if let cell = cell as? CustomizationOptionCollectionViewCell {
            cell.customizationOption = customizationOptions[index]
            cell.setOrderCustomizationOptionTitleLabelText()
            cell.setSelectedSubOptionsLabelText()
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let object = object as? [OrderCustomizationOption] else { return }
        customizationOptions = object
    }
}
