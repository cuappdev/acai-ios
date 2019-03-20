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
    
    var title: String
    var price: Double
    var image: UIImage
    var orderCustomizationOptions: [OrderCustomizationOption]
    
    init(title: String, price: Double, orderCustomizationOptions: [OrderCustomizationOption], image: UIImage) {
        self.title = title
        self.price = price
        self.orderCustomizationOptions = orderCustomizationOptions
        self.image = image
    }
    
    func getSelectedOptionsPrice() -> Double {
        return orderCustomizationOptions.reduce(0, { (result, option) -> Double in
            return result + (option.isSelected ? option.price : 0)
        })
    }
    
    func getSelectedOptions() -> [OrderCustomizationOption] {
        return orderCustomizationOptions.filter({$0.isSelected})
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? MenuItem else {
            return false
        }
        return self.title == object.title
    }
}
