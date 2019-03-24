//
//  BowlItem.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/20/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

enum MenuItemType {
    case bowl, drink, smoothie
}

class MenuItem: ListDiffable {
    
    var image: UIImage
    var options: [OrderCustomizationOption]
    var price: Double
    var title: String
    var type: MenuItemType
    
    init(title: String, price: Double, options: [OrderCustomizationOption], image: UIImage, type: MenuItemType) {
        self.image = image
        self.options = options
        self.price = price
        self.title = title
        self.type = type
    }
    
    func getSelectedToppingsPrice() -> Double {
        return options.filter({$0.type == .topping}).reduce(0) { (result, option) -> Double in
            return result + (option.isSelected && option.type == .topping ? option.price : 0)
        }
    }
    
    func getSelectedToppings() -> [OrderCustomizationOption] {
        return options.filter({$0.type == .topping}).filter({$0.isSelected})
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? MenuItem else {
            return false
        }
        return self.title == object.title && self.price == object.price && self.image == object.image && self.type == object.type && self.options.elementsEqual(object.options, by: { (optionElem, elem) -> Bool in
            return optionElem.isEqual(toDiffableObject: elem)
        })
    }
}
