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
    
//    static let menuItemHeaderImageIdentifier: String = "menuItemHeaderImageIdentifier"
//    static let menuItemButtonCollectionIdentifier: String = "menuItemButtonCollectionIdentifier"
//    static let menuItemCustomizationOptionsIdentifier: String = "menuItemCustomizationOptionsIdentifier"
//    static let menuItemCheckoutListIdentifier: String = "menuItemCheckoutListIdentifier"
    
    static let bowlOrderBaseOptionsIdentifier: String = "bowlOrderBaseOptionsIdentifier"
    static let bowlOrderToppingOptionsIdentifier: String = "bowlOrderToppingOptionsIdentifier"
    static let detailCollectionHeaderIdentifier: String = "detailCollectionHeaderIdentifier"
    
    //AvenirNext-MediumItalic, AvenirNext-Bold, AvenirNext-UltraLight, AvenirNext-DemiBold, AvenirNext-HeavyItalic, AvenirNext-Heavy, AvenirNext-Medium, AvenirNext-Italic, AvenirNext-UltraLightItalic, AvenirNext-BoldItalic, AvenirNext-Regular, AvenirNext-DemiBoldItalic
    static let avenirNextMedium: UIFont = UIFont(name: "AvenirNext-Medium", size: 12)!
    static let avenirNextDemi: UIFont = UIFont(name: "AvenirNext-DemiBold", size: 12)!
    static let avenirNextBold: UIFont = UIFont(name: "AvenirNext-Bold", size: 12)!
    
    //hard code for testing
    //NOTE: UI gets messed up if same named option is put more than once in list
    static let miamiBowl = MenuItem(title: "Miami Bowl", price: 9.99, customizationOptions: [], image: UIImage())
    
    static let testBowl = BowlItem(title: "Test Bowl", price: 9.99, baseOptions: [
            CustomizationOption(title: "Acai", isSelected: false, price: 9.99, type: .base),
            CustomizationOption(title: "Oatmeal", isSelected: false, price: 6.99, type: .base),
            CustomizationOption(title: "Yogurt", isSelected: true, price: 6.99, type: .base)
        ], toppingOptions: [
            CustomizationOption(title: "Strawberry", isSelected: true, price: 0.00, type: .topping),
            CustomizationOption(title: "Pineapple", isSelected: false, price: 0.00, type: .topping),
            CustomizationOption(title: "Granola", isSelected: false, price: 0.00, type: .topping),
            CustomizationOption(title: "Coconut", isSelected: true, price: 0.00, type: .topping),
            CustomizationOption(title: "Almonds", isSelected: false, price: 0.00, type: .topping),
            CustomizationOption(title: "Peanut Butter", isSelected: false, price: 0.00, type: .topping)
        ], image: UIImage())
    
}
