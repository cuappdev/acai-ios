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
        
        if (option.title == "Add Item" || option.title == "Reset Bowl Options") {
            return CGSize(width: width, height: 60)
        }
        
        return CGSize(width: width, height: 50)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let option = customizationOption else {
            return UICollectionViewCell()
        }
        let cellClass: AnyClass = (option.title == "Add Item" || option.title == "Reset Bowl Options" ? ButtonCollectionViewCell.self : CustomizationOptionCollectionViewCell.self)
        let cell = collectionContext!.dequeueReusableCell(of: cellClass, for: self, at: index)
        if let cell = cell as? CustomizationOptionCollectionViewCell {
            cell.titleLabel.text = customizationOption.title
            
            cell.optionsLabel.text = ""
            for subOption in customizationOption.options {
                if (subOption.isSelected) {
                    if let optionsText = cell.optionsLabel.text {
                        if optionsText == "" {
                            cell.optionsLabel.text = "\(subOption.title)"
                        }
                        else {
                            cell.optionsLabel.text = "\(optionsText), \(subOption.title)"
                        }
                    }
                }
            }
            
        }
        else if let cell = cell as? ButtonCollectionViewCell {
            cell.button.setTitle(option.title, for: .normal)
            if option.title == "Add Item" {
                cell.button.setTitleColor(Acai.orange, for: .normal)
                cell.button.addTarget(self, action: #selector(addItem), for: .touchUpInside)
            }
            else {
                cell.button.setTitleColor(Acai.lightGray, for: .normal)
                cell.button.addTarget(self, action: #selector(resetOptions), for: .touchUpInside)
            }
        }
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let object = object as? CustomizationOption else { return }
        customizationOption = object
    }
    
    @objc func addItem() {
        print("Add Item clicked")
    }
    
    @objc func resetOptions() {
        print("Reset Bowl Options clicked")
    }
}
