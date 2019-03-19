////
////  CustomizationOption.swift
////  acai-ios
////
////  Created by Artesia Ko on 3/5/19.
////  Copyright © 2019 Cornell AppDev. All rights reserved.
////
//
//import Foundation
//import IGListKit
//
//class MenuItem: ListDiffable {
//
//    var title: String = ""
//    var basePrice: Double = 0
//    var image: UIImage = UIImage()
//    var customizationOptions: [OrderCustomizationOption] = []
//
//    init (title: String, basePrice: Double, customizationOptions: [OrderCustomizationOption], image: UIImage) {
//        self.title = title
//        self.basePrice = basePrice
//        self.customizationOptions = customizationOptions
//        self.image = image
//    }
//
//    func getSelectedSubOptionsPrice() -> Double {
//        var selectedSubOptionsPrice: Double = 0
//        for option in customizationOptions {
//            for subOption in option.options {
//                if (subOption.isSelected) {
//                    selectedSubOptionsPrice += subOption.price
//                }
//            }
//        }
//        return selectedSubOptionsPrice
//    }
//
//    func getSelectedSubOptionsText() -> String {
//        var selectedSubOptionsText: String = ""
//        for option in customizationOptions {
//            for subOption in option.options {
//                if (subOption.isSelected) {
//                    if selectedSubOptionsText == "" {
//                            selectedSubOptionsText = "\(subOption.title)"
//                    }
//                    else {
//                        selectedSubOptionsText = "\(selectedSubOptionsText), \(subOption.title)"
//                    }
//                }
//            }
//        }
//        return selectedSubOptionsText
//    }
//
//    func getSelectedSubOptions() -> [OrderCustomizationSubOption] {
//        var selectedSubOptions: [OrderCustomizationSubOption] = []
//        for option in customizationOptions {
//            for subOption in option.options {
//                if (subOption.isSelected) {
//                    selectedSubOptions.append(subOption)
//                }
//            }
//        }
//        return selectedSubOptions
//    }
//
//    func diffIdentifier() -> NSObjectProtocol {
//        return title as NSObjectProtocol
//    }
//
//    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
//        guard self !== object else {
//            return true
//        }
//
//        guard let object = object as? MenuItem else {
//            return false
//        }
//        return self.title == object.title && self.basePrice == object.basePrice
//    }
//}
//
//class OrderCustomizationOption: ListDiffable {
//
//    var title: String = ""
//    var options: [OrderCustomizationSubOption] = []
//
//    init (title: String, options: [OrderCustomizationSubOption]) {
//        self.title = title
//        self.options = options
//    }
//
//    func diffIdentifier() -> NSObjectProtocol {
//        return title as NSObjectProtocol
//    }
//
//    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
//
//        guard self !== object else {
//            return true
//        }
//
//        guard let object = object as? OrderCustomizationOption else {
//            return false
//        }
//
//        for option in options {
//            for option2 in object.options {
//                if option.equalTo(subOption: option2) {
//                    break
//                }
//                else if let lastOption = options.last, !option.equalTo(subOption: option2) && option.equalTo(subOption: lastOption){
//                    return false
//                }
//            }
//        }
//
//        return title == object.title
//    }
//}
//
//class OrderCustomizationSubOption {
//    var title: String = ""
//    var isSelected: Bool = false
//    var price: Double = 0
//
//    init (title: String, isSelected: Bool, price: Double) {
//        self.title = title
//        self.isSelected = isSelected
//        self.price = price
//    }
//
//    func equalTo(subOption: OrderCustomizationSubOption) -> Bool {
//        return self.title == subOption.title && self.price == subOption.price
//    }
//
//}
