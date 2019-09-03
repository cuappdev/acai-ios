//
//  OrderHistoryCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

class OrderHistoryCollectionViewCell: UICollectionViewCell {

    // MARK: View vars

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupConstraints()
    }

    // TODO: setup cell constraints
    private func setupConstraints() {

    }

    // TODO: change to CartItem
    func configure(for order: String) {

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
