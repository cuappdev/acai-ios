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
    
    static let menuItemHeaderImageIdentifier: String = "menuItemHeaderImageIdentifier"
    static let menuItemButtonCollectionIdentifier: String = "menuItemButtonCollectionIdentifier"
    static let menuItemCustomizationOptionsIdentifier: String = "menuItemCustomizationOptionsIdentifier"
    static let menuItemCheckoutListIdentifier: String = "menuItemCheckoutListIdentifier"
    
    //AvenirNext-MediumItalic, AvenirNext-Bold, AvenirNext-UltraLight, AvenirNext-DemiBold, AvenirNext-HeavyItalic, AvenirNext-Heavy, AvenirNext-Medium, AvenirNext-Italic, AvenirNext-UltraLightItalic, AvenirNext-BoldItalic, AvenirNext-Regular, AvenirNext-DemiBoldItalic
    static let avenirNextMedium: UIFont = UIFont(name: "AvenirNext-Medium", size: 12)!
    static let avenirNextDemi: UIFont = UIFont(name: "AvenirNext-DemiBold", size: 12)!
    
    //hard code for testing
    //NOTE: UI gets messed up if same named option is put more than once in list
    static let miamiBowl = MenuItem(title: "Miami Bowl", basePrice: 9.99, customizationOptions: [
        OrderCustomizationOption(title: "Base Options", options: [
            OrderCustomizationSubOption(title: "Acai", isSelected: true, price: 1.00)]),
        OrderCustomizationOption(title: "Fruit", options: [
            OrderCustomizationSubOption(title: "Pineapple", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "Banana", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "Strawberry", isSelected: false, price: 1.00)]),
        OrderCustomizationOption(title: "Toppings", options: [
            OrderCustomizationSubOption(title: "Granola", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "Coconut Chips", isSelected: true, price: 1.00)]),
        OrderCustomizationOption(title: "Allergens", options: [
            OrderCustomizationSubOption(title: "Nut Free", isSelected: true, price: 1.00)])
        ], image: UIImage())
    
    static let testBowl = MenuItem(title: "Test Bowl", basePrice: 9.99, customizationOptions: [
        OrderCustomizationOption(title: "Base Options", options: [
            OrderCustomizationSubOption(title: "Acai", isSelected: true, price: 1.00)]),
        OrderCustomizationOption(title: "Fruit", options: [
            OrderCustomizationSubOption(title: "Pineapple", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "Banana", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "Strawberry", isSelected: false, price: 1.00)]),
        OrderCustomizationOption(title: "Toppings", options: [
            OrderCustomizationSubOption(title: "Granola", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "Coconut Chips", isSelected: true, price: 1.00)]),
        OrderCustomizationOption(title: "Allergens", options: [
            OrderCustomizationSubOption(title: "Nut Free", isSelected: true, price: 1.00)]),
        OrderCustomizationOption(title: "ABC", options: [
            OrderCustomizationSubOption(title: "a", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "aa", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "aaa", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "aaaa", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "aaaaa", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "aaaaaa", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "aaaaaaa", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "aaaaaaaa", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "aaaaaaaaa", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "aaaaaaaaaa", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "aaaaaaaaaaa", isSelected: true, price: 1.00),
            OrderCustomizationSubOption(title: "aaaaaaaaaaaa", isSelected: true, price: 1.00)
            ]),
        OrderCustomizationOption(title: "B", options: [
            OrderCustomizationSubOption(title: "b", isSelected: true, price: 1.00)]),
        OrderCustomizationOption(title: "C", options: [
            OrderCustomizationSubOption(title: "c", isSelected: true, price: 1.00)]),
        OrderCustomizationOption(title: "D", options: [
            OrderCustomizationSubOption(title: "d", isSelected: true, price: 1.00)]),
        OrderCustomizationOption(title: "E", options: [
            OrderCustomizationSubOption(title: "e", isSelected: true, price: 1.00)])
        
        ], image: UIImage(named: "acaiBowl")!)
    
    
}
