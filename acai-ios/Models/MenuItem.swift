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
        case drink = "Coffee"
        case smoothie = "Smoothie"

        func plural() -> String {
            switch self {
            case .bowl:
                return "Bowls"
            case .drink:
                return "Coffees"
            case .smoothie:
                return "Smoothies"
            }
        }
    }

    let image: UIImage
    // The default options should never change!
    // variations are radio selection
//    let defaultVariations: [OrderOption]
    // modifiers are select many (although it's possible they're also select one)
//    let defaultModifiers: [String: [OrderOption]]
    let defaultOptions: [OrderOption.OptionType: [OrderOption]]
    let price: Double
    let title: String
    let type: ItemType

    init(title: String, price: Double, defaultOptions: [OrderOption.OptionType: [OrderOption]], image: UIImage, type: ItemType) {
        self.image = image
        self.defaultOptions = defaultOptions
        self.price = price
        self.title = title
        self.type = type
    }

    init(title: String, price: Double, defaultOptions: [OrderOption.OptionType: [OrderOption]], type: ItemType) {
        self.defaultOptions = defaultOptions
        self.price = price
        self.title = title
        self.type = type
        switch type {
        case .bowl:
            self.image = UIImage(named: "bowl-icon")!
        case .smoothie:
            self.image = UIImage(named: "smoothie-icon")!
        case .drink:
            self.image = UIImage(named: "drink-icon")!
        }
    }

    func ingredientsString() -> String {
        return defaultOptions.flatMap { $0.1 }.filter { $0.isSelected }.map { $0.title }.joined(separator: ", ")
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
