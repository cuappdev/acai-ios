//
//  PriceCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

class PriceCollectionViewCell: UICollectionViewCell {

    // MARK: View vars
    private var subtotalLabel: UILabel!
    private var subtotalAmountLabel: UILabel!
    private var taxLabel: UILabel!
    private var taxAmountLabel: UILabel!
    private var totalLabel: UILabel!
    private var totalAmountLabel: UILabel!

    // MARK: Constraint Constants
    private enum FileConstants {
        static let imageViewHeightWidth: CGFloat = 206
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        subtotalLabel = UILabel()
        subtotalLabel.font = UIFont.avenirNextDemi.withSize(17)
        subtotalLabel.textColor = .acaiBlack
        subtotalLabel.text = "Subtotal"
        contentView.addSubview(subtotalLabel)

        subtotalAmountLabel = UILabel()
        subtotalAmountLabel.font = UIFont.avenirNextMedium.withSize(17)
        subtotalAmountLabel.textColor = .acaiBlack
        subtotalAmountLabel.textAlignment = .right
        contentView.addSubview(subtotalAmountLabel)

        taxLabel = UILabel()
        taxLabel.font = UIFont.avenirNextDemi.withSize(17)
        taxLabel.textColor = .acaiBlack
        taxLabel.text = "Tax"
        contentView.addSubview(taxLabel)

        taxAmountLabel = UILabel()
        taxAmountLabel.font = UIFont.avenirNextMedium.withSize(17)
        taxAmountLabel.textColor = .acaiBlack
        taxAmountLabel.textAlignment = .right
        contentView.addSubview(taxAmountLabel)

        totalLabel = UILabel()
        totalLabel.font = UIFont.avenirNextBold.withSize(17)
        totalLabel.textColor = .black
        totalLabel.text = "Total"
        contentView.addSubview(totalLabel)

        totalAmountLabel = UILabel()
        totalAmountLabel.font = UIFont.avenirNextBold.withSize(17)
        totalAmountLabel.textColor = .mango
        totalAmountLabel.textAlignment = .right
        contentView.addSubview(totalAmountLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        let bottomTopOffset = 25
        let largeVerticalOffset = 17
        let leadingTrailingOffset = 24
        let smallVerticalOffset = 4

        subtotalLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingTrailingOffset)
            make.top.equalToSuperview().offset(bottomTopOffset)
        }
        subtotalAmountLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
            make.leading.equalTo(subtotalLabel.snp.trailing).offset(leadingTrailingOffset)
            make.centerY.equalTo(subtotalLabel)
        }
        taxLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingTrailingOffset)
            make.top.equalTo(subtotalLabel.snp.bottom).offset(smallVerticalOffset)
        }
        taxAmountLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
            make.leading.equalTo(taxLabel.snp.trailing).offset(leadingTrailingOffset)
            make.centerY.equalTo(taxLabel)
        }
        totalLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingTrailingOffset)
            make.top.equalTo(taxLabel.snp.bottom).offset(largeVerticalOffset)
        }
        totalAmountLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
            make.leading.equalTo(totalLabel.snp.trailing).offset(leadingTrailingOffset)
            make.centerY.equalTo(totalLabel)
        }


    }

    func configure(for subtotal: Double) {
        subtotalAmountLabel.text = subtotal.asPriceString()
        // TODO: update labels for tax and total
        taxAmountLabel.text = subtotal.asPriceString()
        totalAmountLabel.text = subtotal.asPriceString()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
