//
//  CustomizationOption.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

class CustomizationOption: ListDiffable {
    
    var title: String = ""
    var options: [CustomizationOptionSubOption] = []
    
    init (title: String, options: [CustomizationOptionSubOption]) {
        self.title = title
        self.options = options
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
        
        return title == object.title
    }
}
