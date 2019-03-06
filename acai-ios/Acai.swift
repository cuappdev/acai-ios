//
//  Acai.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import UIKit

class Acai {
    
    static var lightGray: UIColor = UIColor(red: 199/255, green: 199/255, blue: 199/255, alpha: 1.0)
    static var medGray: UIColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1.0)
    static var darkGray: UIColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1.0)
    static var lineGray: UIColor = UIColor(red: 228/255, green: 226/255, blue: 226/255, alpha: 1.0)
    static var orange: UIColor = UIColor(red: 247/255, green: 95/255, blue: 35/255, alpha: 1.0)
    
    //hard code for testing
    
    static var customizationOptions = [
        CustomizationOption(title: "Base Options", options: [
            CustomizationOptionSubOption(title: "Acai", isSelected: true)]),
        CustomizationOption(title: "Fruit", options: [
            CustomizationOptionSubOption(title: "Pineapple", isSelected: true),
            CustomizationOptionSubOption(title: "Banana", isSelected: true),
            CustomizationOptionSubOption(title: "Strawberry", isSelected: false)]),
        CustomizationOption(title: "Toppings", options: [
            CustomizationOptionSubOption(title: "Granola", isSelected: true),
            CustomizationOptionSubOption(title: "Coconut Chips", isSelected: true)]),
        CustomizationOption(title: "Allergens", options: [
            CustomizationOptionSubOption(title: "Nut Free", isSelected: true)]),
        CustomizationOption(title: "Add Item", options: []),
        CustomizationOption(title: "Reset Bowl Options", options: [])
    ]
    
}
