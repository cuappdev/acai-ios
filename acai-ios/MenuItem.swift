//
//  BowlItem.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/15/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

class MenuItem: ListDiffable {
    
    var title: String = ""
    var price: Double = 0
    var image: UIImage = UIImage()
    var customizationOptions: [CustomizationOption] = []
    
    init (title: String, price: Double, customizationOptions: [CustomizationOption], image: UIImage) {
        self.title = title
        self.price = price
        self.customizationOptions = customizationOptions
        self.image = image
    }
    
    func getSelectedOptionsPrice() -> Double {
        var selectedOptionsPrice: Double = 0
        for option in customizationOptions {
            if (option.isSelected) {
                selectedOptionsPrice += option.price
            }
        }
        return selectedOptionsPrice
    }
    
    func getSelectedOptions() -> [CustomizationOption] {
        var selectedOptions: [CustomizationOption] = []
        for option in customizationOptions {
            if (option.isSelected) {
                selectedOptions.append(option)
            }
        }
        return selectedOptions
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else {
            return true
        }
        
        guard let object = object as? MenuItem else {
            return false
        }
        return self.title == object.title
    }
}

class BowlItem: ListDiffable {
    
    var title: String = ""
    var price: Double = 0
    var image: UIImage = UIImage()
    var baseOptions: [CustomizationOption] = []
    var toppingOptions: [CustomizationOption] = []
    
    init (title: String, price: Double, baseOptions: [CustomizationOption], toppingOptions: [CustomizationOption], image: UIImage) {
        self.title = title
        self.price = price
        self.baseOptions = baseOptions
        self.toppingOptions = toppingOptions
        self.image = image
    }
    
    func getSelectedToppingsPrice() -> Double {
        var selectedToppingsPrice: Double = 0
        for topping in toppingOptions {
            if (topping.isSelected) {
                selectedToppingsPrice += topping.price
            }
        }
        return selectedToppingsPrice
    }
    
    func getSelectedToppings() -> [CustomizationOption] {
        var selectedToppings: [CustomizationOption] = []
        for topping in toppingOptions {
            if (topping.isSelected) {
                selectedToppings.append(topping)
            }
        }
        return selectedToppings
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else {
            return true
        }
        guard let object = object as? BowlItem else {
            return false
        }
        return self.title == object.title
    }
}

enum CustomizationOptionType {
    case topping, base
}

class CustomizationOption: ListDiffable {
    
    var title: String = ""
    var isSelected: Bool = false
    var price: Double = 0
    var type: CustomizationOptionType!
    
    init (title: String, isSelected: Bool, price: Double, type: CustomizationOptionType) {
        self.title = title
        self.isSelected = isSelected
        self.price = price
        self.type = type
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else {
            return true
        }
        guard let object = object as? CustomizationOption else {
            return false
        }
        return title == object.title && price == object.price && type == object.type
    }
    
}
