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
    var priceLabel: UILabel!

    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        optionTitleLabel = UILabel()
        optionTitleLabel.textColor = .acaiBlack
        optionTitleLabel.font = UIFont.avenirNextMedium.withSize(14)
        contentView.addSubview(optionTitleLabel)

        priceLabel = UILabel()
        priceLabel.textColor = .acaiBlack
        priceLabel.font = UIFont.avenirNextMedium.withSize(14)
        contentView.addSubview(priceLabel)

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
        priceLabel.snp.makeConstraints { make in
            make.centerY.trailing.equalToSuperview()
        }
    }

    func configure(for option: OrderOption) {
        optionTitleLabel.text = option.title
        priceLabel.text = option.price > 0 ? option.price.asPriceString() : ""
    }
}
