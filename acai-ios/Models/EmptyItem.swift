//
//  EmptyItem.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/20/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

class EmptyItem: ListDiffable {
    
    var height: CGFloat
    
    init(height: CGFloat) {
        self.height = height
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return height as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? EmptyItem else {
            return false
        }
        return self.height == object.height
    }
}
