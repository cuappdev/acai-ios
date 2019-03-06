//
//  CustomizationOptionCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class CustomizationOptionCollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    var optionsLabel: UILabel!
    var arrow: UIImageView!
    var line: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = ""
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        titleLabel.textColor = Acai.darkGray
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        optionsLabel = UILabel()
        optionsLabel.translatesAutoresizingMaskIntoConstraints = false
        optionsLabel.text = ""
        optionsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        optionsLabel.textColor = Acai.medGray
        optionsLabel.textAlignment = .right
        self.addSubview(optionsLabel)
        optionsLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.trailing).offset(20)
        }
        
        arrow = UIImageView()
        arrow.translatesAutoresizingMaskIntoConstraints = false
        
        line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = Acai.lineGray
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
