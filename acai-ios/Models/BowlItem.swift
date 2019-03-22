//
//  BowlItem.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/20/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

class BowlItem: ListDiffable {
    
    var title: String
    var price: Double
    var image: UIImage
    var baseOptions: [OrderCustomizationOption]
    var toppingOptions: [OrderCustomizationOption]
    
    init(title: String, price: Double, baseOptions: [OrderCustomizationOption], toppingOptions: [OrderCustomizationOption], image: UIImage) {
        self.title = title
        self.price = price
        self.baseOptions = baseOptions
        self.toppingOptions = toppingOptions
        self.image = image
    }
    
    func getSelectedToppingsPrice() -> Double {
        return toppingOptions.reduce(0) { (result, option) -> Double in
            return result + (option.isSelected ? option.price : 0)
        }
    }
    
    func getSelectedToppings() -> [OrderCustomizationOption] {
        return toppingOptions.filter({$0.isSelected})
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? BowlItem else {
            return false
        }
        return self.title == object.title && self.price == object.price && self.image == object.image && self.baseOptions.elementsEqual(object.baseOptions, by: { (optionElem, elem) -> Bool in
            return optionElem.isEqual(toDiffableObject: elem)
        }) && self.toppingOptions.elementsEqual(object.toppingOptions, by: { (optionElem, elem) -> Bool in
            return optionElem.isEqual(toDiffableObject: elem)
        })
    }
}
