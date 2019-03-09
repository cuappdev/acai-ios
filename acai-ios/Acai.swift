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
    
    static let avenirNextMedium: UIFont = UIFont(name: "AvenirNextCyr-Medium", size: 12)!
    static let avenirNextDemi: UIFont = UIFont(name: "AvenirNextCyr-Demi", size: 12)!
    
    //hard code for testing
    //NOTE: UI gets messed up if same named option is put more than once in list
    static let miamiBowl = MenuItem(title: "Miami Bowl", basePrice: 9.99, customizationOptions: [
        OrderCustomizationOption(title: "Base Options", options: [
            OrderCustomizationSubOption(title: "Acai", isSelected: true)]),
        OrderCustomizationOption(title: "Fruit", options: [
            OrderCustomizationSubOption(title: "Pineapple", isSelected: true),
            OrderCustomizationSubOption(title: "Banana", isSelected: true),
            OrderCustomizationSubOption(title: "Strawberry", isSelected: false)]),
        OrderCustomizationOption(title: "Toppings", options: [
            OrderCustomizationSubOption(title: "Granola", isSelected: true),
            OrderCustomizationSubOption(title: "Coconut Chips", isSelected: true)]),
        OrderCustomizationOption(title: "Allergens", options: [
            OrderCustomizationSubOption(title: "Nut Free", isSelected: true)])
        ], image: UIImage())
    
    static let testBowl = MenuItem(title: "Test Bowl", basePrice: 9.99, customizationOptions: [
        OrderCustomizationOption(title: "Base Options", options: [
            OrderCustomizationSubOption(title: "Acai", isSelected: true)]),
        OrderCustomizationOption(title: "Fruit", options: [
            OrderCustomizationSubOption(title: "Pineapple", isSelected: true),
            OrderCustomizationSubOption(title: "Banana", isSelected: true),
            OrderCustomizationSubOption(title: "Strawberry", isSelected: false)]),
        OrderCustomizationOption(title: "Toppings", options: [
            OrderCustomizationSubOption(title: "Granola", isSelected: true),
            OrderCustomizationSubOption(title: "Coconut Chips", isSelected: true)]),
        OrderCustomizationOption(title: "Allergens", options: [
            OrderCustomizationSubOption(title: "Nut Free", isSelected: true)]),
        OrderCustomizationOption(title: "ABC", options: [
            OrderCustomizationSubOption(title: "a", isSelected: true),
            OrderCustomizationSubOption(title: "aa", isSelected: true),
            OrderCustomizationSubOption(title: "aaa", isSelected: true),
            OrderCustomizationSubOption(title: "aaaa", isSelected: true),
            OrderCustomizationSubOption(title: "aaaaa", isSelected: true),
            OrderCustomizationSubOption(title: "aaaaaa", isSelected: true),
            OrderCustomizationSubOption(title: "aaaaaaa", isSelected: true),
            OrderCustomizationSubOption(title: "aaaaaaaa", isSelected: true),
            OrderCustomizationSubOption(title: "aaaaaaaaa", isSelected: true),
            OrderCustomizationSubOption(title: "aaaaaaaaaa", isSelected: true),
            OrderCustomizationSubOption(title: "aaaaaaaaaaa", isSelected: true),
            OrderCustomizationSubOption(title: "aaaaaaaaaaaa", isSelected: true)
            ]),
        OrderCustomizationOption(title: "B", options: [
            OrderCustomizationSubOption(title: "b", isSelected: true)]),
        OrderCustomizationOption(title: "C", options: [
            OrderCustomizationSubOption(title: "c", isSelected: true)]),
        OrderCustomizationOption(title: "D", options: [
            OrderCustomizationSubOption(title: "d", isSelected: true)]),
        OrderCustomizationOption(title: "E", options: [
            OrderCustomizationSubOption(title: "e", isSelected: true)])
        
        ], image: UIImage(named: "acaiBowl")!)
    
    
}
