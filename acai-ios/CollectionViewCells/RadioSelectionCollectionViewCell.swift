//
//  RadioSelectionCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

class RadioSelectionCollectionViewCell: UICollectionViewCell {

    // MARK: View vars
    var imageView: UIImageView!
    var line: UIView!
    var priceLabel: UILabel!
    var radioCircle: UIView!
    var radioFill: UIView!
    var titleLabel: UILabel!

    // MARK: Constraint Constants
    let leadingOffset = 24
    let lineHeight = 1
    let imageViewHeightWidth = 55
    let radioFillHeightWidth = 10
    let radioHeightWidth = 24
    let radioTrailingOffset = 30

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white

        imageView = UIImageView()
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)

        titleLabel = UILabel()
        titleLabel.font = UIFont.avenirNextBold.withSize(17)
        titleLabel.textColor = .acaiBlack
        contentView.addSubview(titleLabel)

        priceLabel = UILabel()
        priceLabel.font = UIFont.avenirNextMedium.withSize(14)
        priceLabel.textColor = .acaiBlack
        contentView.addSubview(priceLabel)

        radioCircle = UIView()
        radioCircle.backgroundColor = .white
        radioCircle.layer.borderColor = UIColor.coldGray.cgColor
        radioCircle.layer.borderWidth = 2
        radioCircle.layer.cornerRadius = CGFloat(radioHeightWidth/2)
        contentView.addSubview(radioCircle)

        radioFill = UIView()
        radioFill.backgroundColor = .mango
        radioFill.layer.cornerRadius = CGFloat(radioFillHeightWidth/2)
        contentView.addSubview(radioFill)

        line = UIView()
        line.backgroundColor = .lineGray
        contentView.addSubview(line)

        setupConstraints()
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingOffset)
            make.height.width.equalTo(imageViewHeightWidth)
            make.centerY.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(leadingOffset)
            make.bottom.equalTo(self.snp.centerY)
            make.trailing.equalTo(titleLabel.snp.trailing)
        }

        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(self.snp.centerY)
            make.trailing.equalTo(priceLabel.snp.trailing)
        }

        radioCircle.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-radioTrailingOffset)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(radioHeightWidth)
        }

        radioFill.snp.makeConstraints { make in
            make.centerX.equalTo(radioCircle.snp.centerX)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(radioFillHeightWidth)
        }

        line.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(lineHeight)
        }
    }

    func configure(for option: OrderOption) {
        imageView.image = option.image
        titleLabel.text = option.title
        priceLabel.text = option.price.asPriceString()
        radioCircle.layer.borderColor = option.isSelected ? UIColor.mango.cgColor : UIColor.coldGray.cgColor
        radioFill.isHidden = !option.isSelected
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
