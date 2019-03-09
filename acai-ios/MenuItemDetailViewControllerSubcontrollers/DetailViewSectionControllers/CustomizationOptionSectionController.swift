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

    var customizationOption: OrderCustomizationOption!
    
    override init() {
        super.init()
    }
    
    override func numberOfItems() -> Int {
        //return customizationOptions.count
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext, let option = customizationOption else {
            return .zero
        }
        let width = context.containerSize.width
        return CGSize(width: width, height: 50)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CustomizationOptionCollectionViewCell.self, for: self, at: index)
        if let cell = cell as? CustomizationOptionCollectionViewCell {
            //let customizationOption = customizationOptions[index]
            cell.customizationOption = customizationOption
            cell.setOrderCustomizationOptionTitleLabelText()
            cell.setSelectedSubOptionsLabelText()
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let object = object as? OrderCustomizationOption else { return }
        customizationOption = object
    }
}
