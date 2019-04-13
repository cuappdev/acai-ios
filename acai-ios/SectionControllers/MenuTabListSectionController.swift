//
//  MenuTabListSectionController.swift
//  acai-ios
//
//  Created by Drew Dunne on 3/28/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit

protocol MenuTabDelegate: class {
    func selectedTabDidChange(to tab: NSNumber)
}

class MenuTabListSectionController: ListSectionController {

    // MARK: Data
    var selectedTab: NSNumber!

    // MARK: Delegates
    weak var delegate: MenuTabDelegate?

    override func sizeForItem(at index: Int) -> CGSize {
        let cellHeight: CGFloat = 51
        return CGSize(width: collectionContext!.containerSize.width, height: cellHeight)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!
            .dequeueReusableCell(of: MenuTabCollectionViewCell.self, for: self, at: index)
            as! MenuTabCollectionViewCell
        cell.menuTabView.addTarget(self, action: #selector(selectedDidChange), for: .valueChanged)
        cell.menuTabView.selectedSegmentIndex = selectedTab.intValue
        return cell
    }

    override func didUpdate(to object: Any) {
        selectedTab = object as? NSNumber
    }

    @objc func selectedDidChange(sender: MenuTabView) {
        selectedTab = NSNumber(value: sender.selectedSegmentIndex)
        delegate?.selectedTabDidChange(to: selectedTab)
    }
    
}
