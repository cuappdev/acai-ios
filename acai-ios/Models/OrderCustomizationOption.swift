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
    case base, topping
}

class OrderCustomizationOption: ListDiffable, NSCopying {
    
    var image: UIImage
    var isSelected: Bool
    var price: Double
    var title: String
    var type: OrderCustomizationOptionType!
    
    init(title: String, isSelected: Bool, price: Double, type: OrderCustomizationOptionType) {
        self.image = UIImage()
        self.isSelected = isSelected
        self.price = price
        self.title = title
        self.type = type
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
    
    let options: [OrderCustomizationOption]!
    
    init(options: [OrderCustomizationOption]) {
        self.options = options
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return options as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? OrderCustomizationOptions else { return false }
        return self.options.elementsEqual(object.options, by: { (optionElem, elem) -> Bool in
            return optionElem.isEqual(toDiffableObject: elem)
        })
    }
}
