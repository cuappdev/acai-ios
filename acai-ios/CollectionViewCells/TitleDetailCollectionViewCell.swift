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
        let fontSize: CGFloat = 17

        detailLabel.text = textItem.detail
        titleLabel.text = textItem.title

        switch textItem.type {
        case .bold:
            titleLabel.font = UIFont.avenirNextBold.withSize(fontSize)
            detailLabel.font = UIFont.avenirNextBold.withSize(fontSize)
            titleLabel.textColor = .black
            detailLabel.textColor = .mango
        case .demiBold:
            titleLabel.font = UIFont.avenirNextDemi.withSize(fontSize)
            detailLabel.font = UIFont.avenirNextDemi.withSize(fontSize)
            titleLabel.textColor = .black
            detailLabel.textColor = .black
        case .medium:
            titleLabel.font = UIFont.avenirNextMedium.withSize(fontSize)
            detailLabel.font = UIFont.avenirNextMedium.withSize(fontSize)
            titleLabel.textColor = .black
            detailLabel.textColor = .black
        case .regular:
            titleLabel.font = UIFont.avenirNextRegular.withSize(fontSize)
            detailLabel.font = UIFont.avenirNextRegular.withSize(fontSize)
            titleLabel.textColor = .black
            detailLabel.textColor = .black
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
