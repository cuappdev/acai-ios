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
    
    var titleLabel: UILabel!
    var priceLabel: UILabel!
    var imageView: UIImageView!
    var radioCircle: UIView!
    var radioFill: UIView!
    var line: UIView!
    
    var customizationOption: CustomizationOption!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(24)
            make.height.width.equalTo(55)
            make.centerY.equalToSuperview()
        }
        
        titleLabel = UILabel()
        titleLabel.text = ""
        titleLabel.font = Acai.avenirNextBold.withSize(17)
        titleLabel.textColor = .acaiBlack
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(imageView.snp.trailing).offset(24)
            make.bottom.equalTo(self.snp.centerY)
            make.trailing.equalTo(titleLabel.snp.trailing)
        }
        
        priceLabel = UILabel()
        priceLabel.text = ""
        priceLabel.font = Acai.avenirNextMedium.withSize(14)
        priceLabel.textColor = .acaiBlack
        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(self.snp.centerY)
            make.trailing.equalTo(priceLabel.snp.trailing)
        }
        
        radioCircle = UIView()
        radioCircle.backgroundColor = .white
        radioCircle.layer.borderColor = UIColor.acaiColdGray.cgColor
        radioCircle.layer.borderWidth = 2
        radioCircle.layer.cornerRadius = 12
        self.addSubview(radioCircle)
        radioCircle.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-30)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(24)
        }
        
        radioFill = UIView()
        radioFill.backgroundColor = .acaiOrange
        radioFill.layer.cornerRadius = 5
        self.addSubview(radioFill)
        radioFill.snp.makeConstraints { (make) in
            make.centerX.equalTo(radioCircle.snp.centerX)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(10)
        }
        
        line = UIView()
        line.backgroundColor = .lineGray
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
