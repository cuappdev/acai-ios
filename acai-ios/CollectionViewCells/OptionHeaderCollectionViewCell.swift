//
//  OptionHeaderCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

class OptionHeaderCollectionViewCell: UICollectionViewCell {

    // MARK: View vars
    var titleLabel: UILabel!

    // MARK: Constraint Constants
    let titleLabelOffset = 16

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .sleetGray
        self.isUserInteractionEnabled = false

        titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.avenirNextMedium.withSize(14)
        contentView.addSubview(titleLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(titleLabelOffset)
            make.trailing.equalToSuperview().offset(-titleLabelOffset)
        }
    }

    func configure(for type: OrderOption.OptionType) {
        switch type {
        case .base:
            titleLabel.text = "Choose your base"
        case .size:
            titleLabel.text = "Choose your size"
        case .topping:
            titleLabel.text = "Choose your toppings"
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
