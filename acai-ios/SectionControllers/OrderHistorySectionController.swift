//
//  OrderHistorySectionController.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import UIKit

class OrderHistorySectionController: ListSectionController {

    // MARK: Data
    // TODO: update to CartItem
    var orders: [String]!

    // TODO: update to CartItem
    init(orders: [String]) {
        self.orders = orders
    }

    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }

        let height: CGFloat = 50

        return CGSize(width: context.containerSize.width, height: height)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!
            .dequeueReusableCell(of: OrderHistoryCollectionViewCell.self, for: self, at: index) as! OrderHistoryCollectionViewCell

        cell.configure(for: orders[index])

        return cell
    }

    override func didUpdate(to object: Any) {
        // TODO: update to [CartItem]
        orders = object as? [String]
    }

}
