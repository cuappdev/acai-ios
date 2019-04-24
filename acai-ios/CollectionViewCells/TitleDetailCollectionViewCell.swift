//
//  TitleDetailCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/23/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

class TitleDetailCollectionViewCell: UICollectionViewCell {

    var detailLabel: UILabel!
    var titleLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        titleLabel = UILabel()
        contentView.addSubview(titleLabel)

        detailLabel = UILabel()
        detailLabel.textAlignment = .right
        contentView.addSubview(detailLabel)

        setUpConstraints()
    }

    // MARK: Constraint setup
    private func setUpConstraints() {
        let leadingTrailingOffset = 24
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingTrailingOffset)
            make.centerY.equalToSuperview()
        }
        detailLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
            make.centerY.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.trailing).offset(leadingTrailingOffset)
        }
    }

    func configure(for textItem: TitleDetailItem) {
        titleLabel.text = textItem.title
        detailLabel.text = textItem.detail
        switch textItem.type {
        case .bold:
            titleLabel.font = UIFont.avenirNextBold.withSize(17)
            detailLabel.font = UIFont.avenirNextBold.withSize(17)
            titleLabel.textColor = .black
            detailLabel.textColor = .mango
        case .demiBold:
            titleLabel.font = UIFont.avenirNextDemi.withSize(17)
            detailLabel.font = UIFont.avenirNextDemi.withSize(17)
            titleLabel.textColor = .black
            detailLabel.textColor = .black
        case .medium:
            titleLabel.font = UIFont.avenirNextMedium.withSize(17)
            detailLabel.font = UIFont.avenirNextMedium.withSize(17)
            titleLabel.textColor = .black
            detailLabel.textColor = .black
        case .regular:
            titleLabel.font = UIFont.avenirNextRegular.withSize(17)
            detailLabel.font = UIFont.avenirNextRegular.withSize(17)
            titleLabel.textColor = .black
            detailLabel.textColor = .black
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
