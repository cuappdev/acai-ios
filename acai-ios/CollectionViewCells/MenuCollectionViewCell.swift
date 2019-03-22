//
//  MenuCollectionViewCell.swift
//  acai-ios
//
//  Created by Jaewon Sim on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    // MARK: View vars
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var ingredientsLabel: UILabel!
    var detailStackView: UIStackView! // include title and ingredients
    var bottomSeparator: UIView!

    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        imageView = UIImageView()
        contentView.addSubview(imageView)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.avenirNextBold.withSize(17)
        titleLabel.numberOfLines = 1
        titleLabel.textColor = .acaiBlack
        
        ingredientsLabel = UILabel()
        ingredientsLabel.font = UIFont.avenirNextMedium.withSize(12)
        ingredientsLabel.numberOfLines = 2
        ingredientsLabel.lineBreakMode = .byWordWrapping
        ingredientsLabel.textColor = .acaiBlack

        detailStackView = UIStackView(arrangedSubviews: [titleLabel, ingredientsLabel])
        detailStackView.axis = .vertical
        detailStackView.alignment = .fill
        detailStackView.distribution = .equalSpacing
        contentView.addSubview(detailStackView)

        bottomSeparator = UIView()
        bottomSeparator.backgroundColor = .lineGray
        contentView.addSubview(bottomSeparator)

        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraint setup
    private func setUpConstraints() {
        let leadingOffset: CGFloat = 24
        let trailingInset: CGFloat = 72
        let imageViewWidthHeight: CGFloat = 64
        let imageViewStackViewHorizontalSpacing: CGFloat = 24
        let bottomSeparatorHeight: CGFloat = 1.0

        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(leadingOffset)
            make.width.height.equalTo(imageViewWidthHeight)
        }
        
        detailStackView.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(imageViewStackViewHorizontalSpacing)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(trailingInset)
        }

        bottomSeparator.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(bottomSeparatorHeight)
        }
    }
}
