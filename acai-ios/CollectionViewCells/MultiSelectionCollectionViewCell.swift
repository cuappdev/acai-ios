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
    
    // MARK: View vars
    var checkMarkImageView: UIImageView!
    var customizationOption: OrderCustomizationOption!
    var line: UIView!
    var selectionRect: UIView!
    var titleLabel: UILabel!
    
    // MARK: Constraint Constants
    let checkMarkImageViewHeight = 12
    let checkMarkImageViewWidth = 16
    let lineHeight = 0.7
    let titleLabelLeadingOffset = 24
    let selectionRectHeightWidth = 25
    let selectionRectTrailingOffset = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.avenirNextMedium.withSize(17)
        titleLabel.textColor = .acaiBlack
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(titleLabelLeadingOffset)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(titleLabel.snp.trailing)
        }
        
        selectionRect = UIView()
        selectionRect.layer.borderWidth = 2
        selectionRect.layer.borderColor = UIColor.acaiColdGray.cgColor
        selectionRect.backgroundColor = .white
        selectionRect.layer.cornerRadius = 3
        contentView.addSubview(selectionRect)
        
        selectionRect.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-selectionRectTrailingOffset)
            make.height.width.equalTo(selectionRectHeightWidth)
            make.centerY.equalToSuperview()
        }
        
        checkMarkImageView = UIImageView()
        checkMarkImageView.image = UIImage(named: "multiSelectionCheckmark")
        checkMarkImageView.contentMode = .scaleAspectFit
        selectionRect.addSubview(checkMarkImageView)
        checkMarkImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(checkMarkImageViewHeight)
            make.width.equalTo(checkMarkImageViewWidth)
        }
        
        line = UIView()
        line.backgroundColor = .lineGray
        contentView.addSubview(line)
        
        line.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(lineHeight)
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
        } else {
            selectionRect.layer.borderColor = UIColor.acaiColdGray.cgColor
            selectionRect.backgroundColor = .white
            titleLabel.textColor = .acaiBlack
        }
    }
    
    func configure(for option: OrderCustomizationOption) {
        customizationOption = option
        updateSelectionRect()
        setOrderCustomizationOptionTitleLabelText()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
