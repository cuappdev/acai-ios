////
////  HeaderListSectionController.swift
////  acai-ios
////
////  Created by Artesia Ko on 3/18/19.
////  Copyright © 2019 Cornell AppDev. All rights reserved.
////
//
//import UIKit
//import IGListKit
//
//class HeaderListSectionController: ListSectionController {
//    
//    // MARK: Data
//    var title: String!
//    
//    // MARK: Constraint Constants
//    let headerHeightConstraint: CGFloat = 43
//    
//    init(title: String) {
//        self.title = title
//    }
//    
//    override func sizeForItem(at index: Int) -> CGSize {
//        guard let context = collectionContext else {
//            return .zero
//        }
//        return CGSize(width: context.containerSize.width, height: headerHeightConstraint)
//    }
//    
//    override func cellForItem(at index: Int) -> UICollectionViewCell {
//        let cell = collectionContext!.dequeueReusableCell(of: OptionHeaderCollectionViewCell.self, for: self, at: index) as! OptionHeaderCollectionViewCell
//        return cell
//    }
//    
//    override func didUpdate(to object: Any) {
//        if let object = object as? HeaderItem {
//            title = object.title
//        }
//    }
//    
//}
