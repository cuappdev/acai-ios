//
//  CartOptionCollectionViewCell.swift
//  acai-ios
//
//  Created by Jaewon Sim on 4/14/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class CartOptionCollectionViewCell: UICollectionViewCell {

    // MARK: View vars
    var optionTitleLabel: UILabel!
    var additionalPriceLabel: UILabel!

    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        optionTitleLabel = UILabel()
        optionTitleLabel.textColor = .acaiBlack
        optionTitleLabel.font = UIFont.avenirNextMedium.withSize(14)
        contentView.addSubview(optionTitleLabel)

        additionalPriceLabel = UILabel()
        additionalPriceLabel.textColor = .acaiBlack
        additionalPriceLabel.font = UIFont.avenirNextMedium.withSize(14)
        contentView.addSubview(additionalPriceLabel)

        setUpConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Constraint setup
    private func setUpConstraints() {
        optionTitleLabel.snp.makeConstraints { make in
            make.centerY.leading.equalToSuperview()
        }

        additionalPriceLabel.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
        }
    }
}
