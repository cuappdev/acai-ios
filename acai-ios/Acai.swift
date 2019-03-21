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
    static let testBowl = BowlItem(title: "Test Bowl", price: 8.99, baseOptions: [
            OrderCustomizationOption(title: "Acai", isSelected: false, price: 9.99, type: .base),
            OrderCustomizationOption(title: "Oatmeal", isSelected: false, price: 6.99, type: .base),
            OrderCustomizationOption(title: "Yogurt", isSelected: true, price: 6.99, type: .base)
        ], toppingOptions: [
            OrderCustomizationOption(title: "Strawberry", isSelected: true, price: 1.00, type: .topping),
            OrderCustomizationOption(title: "Pineapple", isSelected: false, price: 1.00, type: .topping),
            OrderCustomizationOption(title: "Granola", isSelected: false, price: 1.00, type: .topping),
            OrderCustomizationOption(title: "Coconut", isSelected: true, price: 1.00, type: .topping),
            OrderCustomizationOption(title: "Almonds", isSelected: false, price: 1.00, type: .topping),
            OrderCustomizationOption(title: "Peanut Butter", isSelected: false, price: 1.00, type: .topping)
        ], image: UIImage())
    
}
