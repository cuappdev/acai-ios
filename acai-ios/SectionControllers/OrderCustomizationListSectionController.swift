//
//  OrderCustomizationListSectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/15/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

class OrderCustomizationListSectionController: ListSectionController {
    
    weak var deselectOptionDelegate: DidDeselectOption?
    weak var selectOptionDelegate: DidSelectOption?
    var selectedBaseIndex: Int = 0
    var options: [CustomizationOption]!
    
    override init() {
        super.init()
    }
    
    override func numberOfItems() -> Int {
        return options.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let option = options[index]
        let width = context.containerSize.width
        switch option.type {
        case .base?:
            return CGSize(width: width, height: 87)
        case .topping?:
            return CGSize(width: width, height: 55)
        case .none:
            return .zero
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let option = options[index]
        var cellType: AnyClass = UICollectionViewCell.self
        switch option.type {
        case .base?:
            cellType = RadioSelectionCollectionViewCell.self
            if option.isSelected {
                selectedBaseIndex = index
            }
        case .topping?:
            cellType = MultiSelectionCollectionViewCell.self
        case .none:
            cellType = UICollectionViewCell.self
        }
        let cell = collectionContext!.dequeueReusableCell(of: cellType, for: self, at: index)
        if let cell = cell as? RadioSelectionCollectionViewCell {
            cell.customizationOption = option
            cell.setCustomizationOptionLabelText()
            cell.updateRadioSelection()
        }
        else if let cell = cell as? MultiSelectionCollectionViewCell{
            cell.customizationOption = option
            cell.setOrderCustomizationOptionTitleLabelText()
            cell.updateSelectionRect()
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        guard let object = object as? [CustomizationOption] else { return }
        options = object
    }
    
    func deselectItem(at index: Int) {
        guard let type = options[index].type else {
            return
        }
        switch type {
        case .base:
            self.deselectOptionDelegate?.deselectOption(at: index)
        case .topping:
            return
        }
    }
    
    override func didSelectItem(at index: Int) {
        guard let type = options[index].type else {
            return
        }
        switch type {
        case .base:
            deselectItem(at: selectedBaseIndex)
            selectedBaseIndex = index
            self.selectOptionDelegate?.selectOption(at: index, type: type)
        case .topping:
            self.selectOptionDelegate?.selectOption(at: index, type: type)
        }
    }
}

