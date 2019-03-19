//
//  MultiSelectionCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class MultiSelectionCollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    var customizationOption: CustomizationOption!
    var selectionRect: UIView!
    var line: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = UILabel()
        titleLabel.text = ""
        titleLabel.font = Acai.avenirNextMedium.withSize(17)
        titleLabel.textColor = .acaiBlack
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(24)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(titleLabel.snp.trailing)
        }
        selectionRect = UIView()
        selectionRect.layer.borderWidth = 2
        selectionRect.layer.borderColor = UIColor.acaiColdGray.cgColor
        selectionRect.backgroundColor = .white
        selectionRect.layer.cornerRadius = 3
        self.addSubview(selectionRect)
        selectionRect.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(24)
            make.width.equalTo(24)
            make.centerY.equalToSuperview()
        }
        line = UIView()
        line.backgroundColor = .lineGray
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(0.7)
            make.bottom.equalToSuperview()
        }
    }
    
    func setOrderCustomizationOptionTitleLabelText() {
        titleLabel.text = customizationOption.title
    }
    
    func updateSelectionRect() {
        if customizationOption.isSelected {
            selectionRect.backgroundColor = .acaiOrange
            selectionRect.layer.borderColor = UIColor.acaiOrange.cgColor
            titleLabel.textColor = .acaiOrange
        }
        else {
            selectionRect.layer.borderColor = UIColor.acaiColdGray.cgColor
            selectionRect.backgroundColor = .white
            titleLabel.textColor = .acaiBlack
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
