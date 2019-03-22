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
    var detailStackView: UIStackView! //include title and ingredients

    var additionalPricingLabel: UILabel!
    var selectButton: UIButton!
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        imageView = UIImageView()
        contentView.addSubview(imageView)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        titleLabel.textColor = .black
        
        ingredientsLabel = UILabel()
        ingredientsLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        ingredientsLabel.numberOfLines = 0
        ingredientsLabel.lineBreakMode = .byWordWrapping
        ingredientsLabel.textColor = .black

        detailStackView = UIStackView()
        detailStackView.axis = .vertical
        detailStackView.alignment = .fill
        detailStackView.distribution = .equalSpacing
        contentView.addSubview(detailStackView)
        
        detailStackView.addArrangedSubview(titleLabel)
        detailStackView.addArrangedSubview(ingredientsLabel)
 
        additionalPricingLabel = UILabel()
        additionalPricingLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        additionalPricingLabel.textColor = .black
        contentView.addSubview(additionalPricingLabel)
        
        selectButton = UIButton()
        selectButton.layer.cornerRadius = 8
        selectButton.setTitle("Select", for: .normal)
        selectButton.backgroundColor = UIColor(red: 1.0, green: 156.0 / 255.0, blue: 29.0 / 255.0, alpha: 1.0)
        selectButton.tintColor = .white
        contentView.addSubview(selectButton)
        
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraint setup
    private func setUpConstraints() {
        let leadingOffset: CGFloat = 24
        let trailingInset: CGFloat = 16
        let selectButtonWidth: CGFloat = 84
        let imageViewWidthHeight: CGFloat = 64
        let imageViewStackViewHorizontalSpacing: CGFloat = 24
        let stackViewSelectButtonHorizontalSpacing: CGFloat = 17
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingOffset)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(imageViewWidthHeight)
        }
        
        detailStackView.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(imageViewStackViewHorizontalSpacing)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(selectButton.snp.leading).offset(-stackViewSelectButtonHorizontalSpacing)
        }
        
        selectButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(trailingInset)
            make.width.equalTo(selectButtonWidth)
            make.centerY.equalToSuperview()
        }
    }
}
