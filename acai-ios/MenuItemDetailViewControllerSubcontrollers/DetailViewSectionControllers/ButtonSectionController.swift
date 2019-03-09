//
//  ButtonSectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/7/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class ButtonSectionController: ListSectionController {
    var menuItem: MenuItem!
    var customizationOptions: [OrderCustomizationOption]!
    override init() {
        super.init()
    }

    override func numberOfItems() -> Int {
        return 2
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: 70)
    }
        
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: ButtonCollectionViewCell.self, for: self, at: index)
        if let cell = cell as? ButtonCollectionViewCell {
            if index == 0 {
                cell.button.setTitle("Add Item", for: .normal)
                cell.button.setTitleColor(.white, for: .normal)
                cell.button.addTarget(self, action: #selector(addItem), for: .touchUpInside)
                cell.button.backgroundColor = .acaiMutedOrange
            }
            else if index == 1 {
                cell.button.setTitle("Reset Options", for: .normal)
                cell.button.setTitleColor(.acaiLightGray, for: .normal)
                cell.button.addTarget(self, action: #selector(resetOptions), for: .touchUpInside)
                cell.button.backgroundColor = .clear
            }
        }
        return cell
    }
        
    override func didUpdate(to object: Any) {
            guard let object = object as? MenuItem else { return }
            menuItem = object
    }
    
    @objc func addItem() {
        print("Add Item clicked")
    }
    
    @objc func resetOptions() {
        print("Reset Bowl Options clicked")
    }

}
