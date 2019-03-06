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

    var customizationOption: CustomizationOption!
    
    override init() {
        super.init()
        
    }
    
    override func numberOfItems() -> Int {
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
            cell.titleLabel.text = customizationOption.title
            
            for option in customizationOption.options {
                if (option.isSelected) {
                    if let optionsText = cell.optionsLabel.text {
                        if optionsText == "" {
                            cell.optionsLabel.text = "\(option.title)"
                        }
                        else {
                            cell.optionsLabel.text = "\(optionsText), \(option.title)"
                        }
                    }
                }
            }
            
        }
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let object = object as? CustomizationOption else { return }
        customizationOption = object
    }
}
