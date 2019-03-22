//
//  RadioSelectionCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class RadioSelectionCollectionViewCell: UICollectionViewCell {
    
    // MARK: View vars
    var imageView: UIImageView!
    var line: UIView!
    var priceLabel: UILabel!
    var radioCircle: UIView!
    var radioFill: UIView!
    var titleLabel: UILabel!
    
    // MARK: Data
    var customizationOption: OrderCustomizationOption!
    
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
        
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingOffset)
            make.height.width.equalTo(imageViewHeightWidth)
            make.centerY.equalToSuperview()
        }
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.avenirNextBold.withSize(17)
        titleLabel.textColor = .acaiBlack
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(leadingOffset)
            make.bottom.equalTo(self.snp.centerY)
            make.trailing.equalTo(titleLabel.snp.trailing)
        }
        
        priceLabel = UILabel()
        priceLabel.font = UIFont.avenirNextMedium.withSize(14)
        priceLabel.textColor = .acaiBlack
        contentView.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(self.snp.centerY)
            make.trailing.equalTo(priceLabel.snp.trailing)
        }
        
        radioCircle = UIView()
        radioCircle.backgroundColor = .white
        radioCircle.layer.borderColor = UIColor.acaiColdGray.cgColor
        radioCircle.layer.borderWidth = 2
        radioCircle.layer.cornerRadius = 12
        contentView.addSubview(radioCircle)
        
        radioCircle.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-radioTrailingOffset)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(radioHeightWidth)
        }
        
        radioFill = UIView()
        radioFill.backgroundColor = .acaiOrange
        radioFill.layer.cornerRadius = 5
        contentView.addSubview(radioFill)
        
        radioFill.snp.makeConstraints { make in
            make.centerX.equalTo(radioCircle.snp.centerX)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(radioFillHeightWidth)
        }
        
        line = UIView()
        line.backgroundColor = .lineGray
        contentView.addSubview(line)
        
        line.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(lineHeight)
        }
    }
    
    func setCustomizationOptionLabelText() {
        titleLabel.text = customizationOption.title
        priceLabel.text = "$\(customizationOption.price)"
    }
    
    func updateRadioSelection() {
        radioFill.isHidden = !customizationOption.isSelected
        radioCircle.layer.borderColor = customizationOption.isSelected ? UIColor.acaiOrange.cgColor : UIColor.acaiColdGray.cgColor
    }
    
    func configure(for option: OrderCustomizationOption) {
        customizationOption = option
        imageView.image = option.image
        updateRadioSelection()
        setCustomizationOptionLabelText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
