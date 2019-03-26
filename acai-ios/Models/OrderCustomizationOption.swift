//
//  File.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/20/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

enum OrderCustomizationOptionType {
    case base, size, topping
}

class OrderCustomizationOption: ListDiffable, NSCopying {
    
    var title: String
    var isSelected: Bool
    var price: Double
    var type: OrderCustomizationOptionType!
    var image: UIImage
    
    init(title: String, isSelected: Bool, price: Double, type: OrderCustomizationOptionType) {
        self.title = title
        self.isSelected = isSelected
        self.price = price
        self.type = type
        self.image = UIImage()
    }
    
    init(title: String, isSelected: Bool, price: Double, type: OrderCustomizationOptionType, image: UIImage) {
        self.title = title
        self.isSelected = isSelected
        self.price = price
        self.type = type
        self.image = image
    }

    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? OrderCustomizationOption else { return false }
        return title == object.title && price == object.price && type == object.type && isSelected == object.isSelected
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return OrderCustomizationOption(title: title, isSelected: isSelected, price: price, type: type, image: image)
    }
}

class OrderCustomizationOptions: ListDiffable {
    
    var options: [OrderCustomizationOption]!
    let type: OrderCustomizationOptionType!
    
    init(options: [OrderCustomizationOption], type: OrderCustomizationOptionType) {
        self.options = options
        self.type = type
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return options as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? OrderCustomizationOptions else { return false }
        return self.type == object.type && self.options.elementsEqual(object.options, by: { (optionElem, elem) -> Bool in
            return optionElem.isEqual(toDiffableObject: elem)
        })
    }
}
