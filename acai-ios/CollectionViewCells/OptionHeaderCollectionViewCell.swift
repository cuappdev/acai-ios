//
//  OptionHeaderCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class OptionHeaderCollectionViewCell: UICollectionViewCell {
    
    // MARK: View vars
    var titleLabel: UILabel!
    
    // MARK: Constraint Constants
    let titleLabelOffset = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .acaiSleetGray
        
        titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.avenirNextMedium.withSize(14)
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(titleLabelOffset)
            make.trailing.equalToSuperview().offset(-titleLabelOffset)
        }
    }
    
    func configure(for title: String) {
        titleLabel.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
