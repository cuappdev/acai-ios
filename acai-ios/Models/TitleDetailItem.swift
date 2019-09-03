//
//  TitleDetailItem.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/23/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import IGListKit

class TitleDetailItem: ListDiffable, NSCopying {

    var title: String!
    var detail: String!
    var type: UIFont.FontWeight

    init(title: String, detail: String, type: UIFont.FontWeight) {
        self.title = title
        self.detail = detail
        self.type = type
    }

    func diffIdentifier() -> NSObjectProtocol {
        return "\(title)\(detail)\(type)" as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? TitleDetailItem else { return false }
        return title == object.title && detail == object.detail && type == object.type
    }

    func copy(with zone: NSZone? = nil) -> Any {
        return TitleDetailItem(title: title, detail: detail, type: type)
    }
}

class TitleDetailItems: ListDiffable {

    let items: DiffableArray

    init(_ titleDetailItems: DiffableArray) {
        self.items = titleDetailItems
    }

    func diffIdentifier() -> NSObjectProtocol {
        return "\(items.allItems())" as NSObjectProtocol
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? TitleDetailItems else { return false }
        return items.isEqual(toDiffableObject: object.items)
    }

}
