//
//  MenuTabCollectionViewCell.swift
//  acai-ios
//
//  Created by Drew Dunne on 3/28/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

class MenuTabCollectionViewCell: UICollectionViewCell {

    // MARK: View vars
    var menuTabView: MenuTabView!

    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .acaiBlack

        let items = Constants.menuTabs.map { tab in tab.rawValue }
        menuTabView = MenuTabView(with: items)
        contentView.addSubview(menuTabView)

        setUpConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Constraint setup
    private func setUpConstraints() {

        let segmentedInsets: CGFloat = 16

        menuTabView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(segmentedInsets)
            make.top.bottom.equalToSuperview()
        }

    }

}
