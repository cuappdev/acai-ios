//
//  DiffableArray.swift
//  acai-ios
//
//  Created by Drew Dunne on 3/27/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

class DiffableArray: ListDiffable {
    private var items: [ListDiffable]

    var count: Int {
        return items.count
    }

    init(_ items: [ListDiffable]) {
        self.items = items
    }

    func allItems() -> [ListDiffable] {
        return items
    }

    subscript(index: Int) -> ListDiffable {
        get {
            return items[index]
        }
        set(newElm) {
            items.insert(newElm, at: index)
        }
    }

    func diffIdentifier() -> NSObjectProtocol {
        return items as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {

        guard let object = object as? DiffableArray else { return false }

        return items.elementsEqual(object.allItems(), by: { (elem, otherElem) -> Bool in
            return elem.isEqual(toDiffableObject: otherElem)
        })

    }
}
