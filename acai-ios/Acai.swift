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
    
    // hard code for testing
    static let testBowl = MenuItem(title: "Test Bowljy", price: 8.99, options: [
        OrderCustomizationOption(title: "Acai", isSelected: false, price: 9.99, type: .base, image: UIImage(named: "acaiBowl")!),
        OrderCustomizationOption(title: "Oatmeal", isSelected: false, price: 6.99, type: .base, image: UIImage(named: "acaiBowl")!),
        OrderCustomizationOption(title: "Yogurt", isSelected: true, price: 6.99, type: .base, image: UIImage(named: "acaiBowl")!),
        OrderCustomizationOption(title: "Strawberry", isSelected: true, price: 1.00, type: .topping),
        OrderCustomizationOption(title: "Pineapple", isSelected: false, price: 1.00, type: .topping),
        OrderCustomizationOption(title: "Granola", isSelected: false, price: 1.00, type: .topping),
        OrderCustomizationOption(title: "Coconut", isSelected: true, price: 1.00, type: .topping),
        OrderCustomizationOption(title: "Almonds", isSelected: false, price: 1.00, type: .topping),
        OrderCustomizationOption(title: "Peanut Butter", isSelected: false, price: 1.00, type: .topping)
        ], image: UIImage(named: "acaiBowl")!, type: .bowl)
    
    static let testSmoothie = MenuItem(title: "Test Smoothie", price: 7.99, options: [
        OrderCustomizationOption(title: "Small", isSelected: false, price: 6.99, type: .size, image: UIImage(named: "acaiBowl")!),
        OrderCustomizationOption(title: "Medium", isSelected: false, price: 7.99, type: .size, image: UIImage(named: "acaiBowl")!),
        OrderCustomizationOption(title: "Large", isSelected: true, price: 8.99, type: .size, image: UIImage(named: "acaiBowl")!),
        OrderCustomizationOption(title: "Strawberry", isSelected: true, price: 1.00, type: .topping),
        OrderCustomizationOption(title: "Pineapple", isSelected: false, price: 1.00, type: .topping),
        OrderCustomizationOption(title: "Granola", isSelected: false, price: 1.00, type: .topping),
        OrderCustomizationOption(title: "Coconut", isSelected: true, price: 1.00, type: .topping),
        OrderCustomizationOption(title: "Almonds", isSelected: false, price: 1.00, type: .topping),
        OrderCustomizationOption(title: "Peanut Butter", isSelected: false, price: 1.00, type: .topping)
        ], image: UIImage(named: "acaiBowl")!, type: .smoothie)
    
}
