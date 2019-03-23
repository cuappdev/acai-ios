//
//  QuantityItem.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

class QuantityItem: ListDiffable {
    
    var quantity: Int
    
    init(quantity: Int) {
        self.quantity = quantity
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return quantity as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? QuantityItem else {
            return false
        }
        return self.quantity == object.quantity
    }
}
