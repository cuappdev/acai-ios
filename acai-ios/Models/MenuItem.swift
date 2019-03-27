//
//  BowlItem.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/20/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

class MenuItem: ListDiffable {

    enum ItemType: String {
        case bowl = "Bowl"
        case drink = "Drink"
        case smoothie = "Smoothie"
    }
    
    var image: UIImage
    // The default options should never change!
    var defaulOptions: [OrderOption.OptionType: [OrderOption]]
    var price: Double
    var title: String
    var type: ItemType
    
    init(title: String, price: Double, defaulOptions: [OrderOption.OptionType: [OrderOption]], image: UIImage, type: ItemType) {
        self.image = image
        self.defaulOptions = defaulOptions
        self.price = price
        self.title = title
        self.type = type
    }

    func diffIdentifier() -> NSObjectProtocol {
        return title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? MenuItem else {
            return false
        }
        return self.title == object.title && self.price == object.price && self.image == object.image && self.type == object.type
    }
}
