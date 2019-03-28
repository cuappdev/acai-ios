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
    var line: UIView!
    var selectionRect: UIView!
    var titleLabel: UILabel!
    
    // MARK: Constraint Constants
    let checkMarkImageViewHeight = 12
    let checkMarkImageViewWidth = 16
    let lineHeight = 0.7
    let selectionRectHeightWidth = 25
    let selectionRectTrailingOffset = 30
    let titleLabelLeadingOffset = 24

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.avenirNextMedium.withSize(17)
        titleLabel.textColor = .acaiBlack
        contentView.addSubview(titleLabel)
        
        selectionRect = UIView()
        selectionRect.layer.borderWidth = 2
        selectionRect.layer.borderColor = UIColor.coldGray.cgColor
        selectionRect.backgroundColor = .white
        selectionRect.layer.cornerRadius = 3
        contentView.addSubview(selectionRect)
        
        checkMarkImageView = UIImageView()
        checkMarkImageView.image = UIImage(named: "multiSelectionCheckmark")
        checkMarkImageView.contentMode = .scaleAspectFit
        selectionRect.addSubview(checkMarkImageView)
        
        line = UIView()
        line.backgroundColor = .lineGray
        contentView.addSubview(line)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(titleLabelLeadingOffset)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(titleLabel.snp.trailing)
        }
        
        selectionRect.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-selectionRectTrailingOffset)
            make.height.width.equalTo(selectionRectHeightWidth)
            make.centerY.equalToSuperview()
        }
        
        checkMarkImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(checkMarkImageViewHeight)
            make.width.equalTo(checkMarkImageViewWidth)
        }
        
        line.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(lineHeight)
        }
    }
    
    func configure(for option: OrderOption) {
        titleLabel.text = option.title
        if option.isSelected {
            selectionRect.backgroundColor = .mango
            selectionRect.layer.borderColor = UIColor.mango.cgColor
            titleLabel.textColor = .mango
        } else {
            selectionRect.layer.borderColor = UIColor.coldGray.cgColor
            selectionRect.backgroundColor = .white
            titleLabel.textColor = .acaiBlack
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
