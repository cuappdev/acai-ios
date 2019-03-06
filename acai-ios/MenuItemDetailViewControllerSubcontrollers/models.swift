//
//  CustomizationOption.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

class MenuItem: ListDiffable {
    
    var title: String = ""
    var basePrice: Double = 0
    var customizationOptions: [CustomizationOption] = []
    
    init (title: String, basePrice: Double, customizationOptions: [CustomizationOption]) {
        self.title = title
        self.basePrice = basePrice
        self.customizationOptions = customizationOptions
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
        return self.title == object.title && self.basePrice == object.basePrice
    }
}

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
        
        for option in options {
            for option2 in object.options {
                if option.equalTo(subOption: option2) {
                    break
                }
                else if let lastOption = options.last, !option.equalTo(subOption: option2) && option.equalTo(subOption: lastOption){
                    return false
                }
            }
        }
        
        return title == object.title
    }
}

class CustomizationOptionSubOption {
    var title: String = ""
    var isSelected: Bool = false
    
    init (title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }
    
    func equalTo(subOption: CustomizationOptionSubOption) -> Bool {
        return self.title == subOption.title
    }
    
}
