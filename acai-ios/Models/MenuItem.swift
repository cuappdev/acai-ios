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
    var optionsArrayObject: OrderCustomizationOptionsArray
    var price: Double
    var title: String
    var type: MenuItemType
    
    init(title: String, price: Double, optionsArrayObject: OrderCustomizationOptionsArray, image: UIImage, type: MenuItemType) {
        self.image = image
        self.optionsArrayObject = optionsArrayObject
        self.price = price
        self.title = title
        self.type = type
    }
    
    func getSelectedToppingsPrice() -> Double {
        return optionsArrayObject.optionsArray.filter({ $0.type == .topping }).reduce(0, { (result, optionsObject) -> Double in
            return result + optionsObject.options.reduce(0, { (result, option) -> Double in
                return result + (option.isSelected && option.type == .topping ? option.price : 0)
            })
        })
    }
    
    func getSelectedOptions() -> [OrderCustomizationOption] {
        var selectedOptions: [OrderCustomizationOption] = []
        if let optionsArray = optionsArrayObject.optionsArray {
            optionsArray.reduce(nil, { (result, optionsObject) -> Void in
                if let options = optionsObject.options {
                    options.reduce(nil, { (result, option) -> Void in
                        if option.isSelected {
                            selectedOptions.append(option)
                        }
                    })
                }
            })
        }
        return selectedOptions
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? MenuItem else {
            return false
        }
        return self.title == object.title && self.price == object.price && self.image == object.image && self.type == object.type && self.optionsArrayObject.isEqual(toDiffableObject: object.optionsArrayObject)
    }
}
