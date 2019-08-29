//
//  OrderCustomizationListSectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/15/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import UIKit

class OrderOptionListSectionController: ListSectionController {

    enum SelectionStyle {
        case radio, multi
    }

    // MARK: Delegates
    weak var selectOptionDelegate: DidSelectOptionDelegate?

    // MARK: Data
    var orderOptions: OrderOptions!
    var selectedBaseIndex: Int = 1

    // MARK: Constraint Constants
    private enum FileConstants {
        static let headerHeightConstraint: CGFloat = 43
        static let radioCellHeightConstraint: CGFloat = 87
        static let multiCellHeightConstraint: CGFloat = 55

        // Possibly need these later?
        //        static let baseCellHeightConstraint: CGFloat = 87
        //        static let headerHeightConstraint: CGFloat = 43
        //        static let sizeCellHeightConstraint: CGFloat = 87
        //        static let toppingCellHeightConstraint: CGFloat = 55
    }

    init(options: OrderOptions) {
        orderOptions = options
    }

    override func numberOfItems() -> Int {
        return orderOptions.options.count + 1
    }

    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else {
            return .zero
        }
        let width = context.containerSize.width
        if index == 0 {
            return CGSize(width: context.containerSize.width, height: FileConstants.headerHeightConstraint)
        }

        switch orderOptions.optionType.selectionStyle() {
        case .radio:
            return CGSize(width: width, height: FileConstants.radioCellHeightConstraint)
        case .multi:
            return CGSize(width: width, height: FileConstants.multiCellHeightConstraint)
        }
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        var cellType: AnyClass = UICollectionViewCell.self
        if index == 0 {
            let cell = collectionContext!.dequeueReusableCell(of: OptionHeaderCollectionViewCell.self, for: self, at: index) as! OptionHeaderCollectionViewCell
            cell.configure(for: orderOptions.optionType)
            return cell
        }

        let option = orderOptions.options[index - 1] as! OrderOption
        switch orderOptions.optionType.selectionStyle() {
        case .radio:
            cellType = RadioSelectionCollectionViewCell.self
            if option.isSelected {
                selectedBaseIndex = index - 1
            }
        case .multi:
            cellType = MultiSelectionCollectionViewCell.self
        }

        let cell = collectionContext!.dequeueReusableCell(of: cellType, for: self, at: index)

        // I feel like we could set up a protocal so we don't have to handle it this way
        if let cell = cell as? RadioSelectionCollectionViewCell {
            cell.configure(for: option)
        } else if let cell = cell as? MultiSelectionCollectionViewCell {
            cell.configure(for: option)
        }
        return cell
    }

    override func didUpdate(to object: Any) {
        orderOptions = object as? OrderOptions
    }

    func deselectItem(at index: Int) {
        if index == 0 { return } // Prevent selection from applying to headers.
        switch orderOptions.optionType.selectionStyle() {
        case .radio:
            self.selectOptionDelegate?.deselectOption(at: index, for: orderOptions.optionType)
        case .multi:
            return
        }
    }

    override func didSelectItem(at index: Int) {
        if index == 0 { return } // Prevent selection from applying to headers.
        if orderOptions.optionType.selectionStyle() == .radio {
            deselectItem(at: selectedBaseIndex)
        }
        self.selectOptionDelegate?.selectOption(at: index - 1, for: orderOptions.optionType)
    }

}
