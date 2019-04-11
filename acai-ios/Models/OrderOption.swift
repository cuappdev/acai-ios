//
//  OrderCustomizationOption.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/20/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

class OrderOption: ListDiffable, NSCopying {

    enum OptionType: String, Comparable {

        case base = "Base"
        case size = "Size"
        case topping = "Toppings"

        static func < (lhs: OrderOption.OptionType, rhs: OrderOption.OptionType) -> Bool {
            switch (lhs, rhs) {
            case (.base, .base), (.size, .size), (.size, .base), (.topping, _):
                return false
            case (.base, _), (.size, _):
                return true
            }
        }

        func selectionStyle() -> OrderOptionListSectionController.SelectionStyle {
            switch self {
            case .base, .size:
                return .radio
            case .topping:
                return .multi
            }
        }

    }

    let title: String
    let isSelected: Bool
    let price: Double
    let image: UIImage

    init(title: String, isSelected: Bool, price: Double) {
        self.title = title
        self.isSelected = isSelected
        self.price = price
        self.image = UIImage()
    }

    init(title: String, isSelected: Bool, price: Double, image: UIImage) {
        self.title = title
        self.isSelected = isSelected
        self.price = price
        self.image = image
    }

    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? OrderOption else { return false }
        return title == object.title && price == object.price && isSelected == object.isSelected
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return OrderOption(title: title, isSelected: isSelected, price: price, image: image)
    }

    func copy(isSelected: Bool) -> OrderOption {
        return OrderOption(title: title, isSelected: isSelected, price: price, image: image)
    }
}

class OrderOptions: ListDiffable {

    let optionType: OrderOption.OptionType
    let options: DiffableArray

    init(_ options: DiffableArray, type: OrderOption.OptionType) {
        self.options = options
        self.optionType = type
    }

    func diffIdentifier() -> NSObjectProtocol {
        return "\(options.allItems())\(optionType)" as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? OrderOptions else { return false }
        return optionType == object.optionType && options.isEqual(toDiffableObject: object.options)
    }

}
