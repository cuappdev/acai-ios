//
//  CenteredButtonListSectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import UIKit

class CenteredButtonListSectionController: ListSectionController {

    weak var delegate: CenteredButtonCollectionViewCellDelegate?

    var title: String

    init(title: String) {
        self.title = title
    }

    override func sizeForItem(at index: Int) -> CGSize {
        let height: CGFloat = 91
        guard let context = collectionContext else {
            return .zero
        }
        return CGSize(width: context.containerSize.width, height: height)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CenteredButtonCollectionViewCell.self, for: self, at: index) as! CenteredButtonCollectionViewCell
        cell.configure(for: title)
        cell.delegate = delegate
        return cell
    }

    override func didUpdate(to object: Any) {
        if let object = object as? String {
            title = object
        }
    }

}
