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
    
    // MARK: Delegates
    weak var selectOptionDelegate: DidSelectOptionDelegate?
    
    // MARK: Data
    var customizationOptions: OrderCustomizationOptions!
    var selectedBaseIndex: Int = 1
    
    // MARK: Constraint Constants
    let baseCellHeightConstraint: CGFloat = 87
    let headerHeightConstraint: CGFloat = 43
    let sizeCellHeightConstraint: CGFloat = 87
    let toppingCellHeightConstraint: CGFloat = 55
    
    init(options: OrderCustomizationOptions) {
        customizationOptions = options
    }
    
    override func numberOfItems() -> Int {
        return customizationOptions.options.count + 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let width = context.containerSize.width
        if index == 0 {
            return CGSize(width: context.containerSize.width, height: headerHeightConstraint)
        }
        switch customizationOptions.options[index - 1].type {
        case .base?:
            return CGSize(width: width, height: baseCellHeightConstraint)
        case .size?:
            return CGSize(width: width, height: sizeCellHeightConstraint)
        case .topping?:
            return CGSize(width: width, height: toppingCellHeightConstraint)
        case .none:
            return .zero
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        var cellType: AnyClass = UICollectionViewCell.self
        if index == 0 {
            let cell = collectionContext!.dequeueReusableCell(of: OptionHeaderCollectionViewCell.self, for: self, at: index) as! OptionHeaderCollectionViewCell
            cell.configure(for: customizationOptions.type)
            return cell
        }
        
        let option = customizationOptions.options[index - 1]
        if let type = option.type {
            switch type {
            case .base:
                cellType = RadioSelectionCollectionViewCell.self
                if option.isSelected {
                    selectedBaseIndex = index - 1
                }
            case .size:
                cellType = RadioSelectionCollectionViewCell.self
                if option.isSelected {
                    selectedBaseIndex = index - 1
                }
            case .topping:
                cellType = MultiSelectionCollectionViewCell.self
            }
        }
        
        let cell = collectionContext!.dequeueReusableCell(of: cellType, for: self, at: index)
        if let cell = cell as? RadioSelectionCollectionViewCell {
            cell.configure(for: option)
        } else if let cell = cell as? MultiSelectionCollectionViewCell {
            cell.configure(for: option)
        }
        return cell
    }
    
    override func didUpdate(to object: Any) {
        customizationOptions = object as? OrderCustomizationOptions
    }
    
    func deselectItem(at index: Int) {
        guard let type = customizationOptions.options[index].type else { return }
        switch type {
        case .base:
            self.selectOptionDelegate?.deselectOption(at: index)
        case .size:
            self.selectOptionDelegate?.deselectOption(at: index)
        case .topping:
            return
        }
    }
    
    override func didSelectItem(at index: Int) {
        guard let type = customizationOptions.options[index - 1].type else { return }
        if type == .base || type == .size {
            deselectItem(at: selectedBaseIndex)
        }
        self.selectOptionDelegate?.selectOption(at: index - 1, type: type)
    }
    
}
