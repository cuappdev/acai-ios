//
//  ActionTabView.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/20/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class ActionTabView: UIView {

    // MARK: View vars
    var titleLabel: UILabel!
    var priceLabel: UILabel!
    
    // MARK: Constraint Constants
    let titleLabelLeadingOffset = 16
    let priceLabelTrailingOffset = 14
    
    init(frame: CGRect, title: String, price: Double) {
        super.init(frame: frame)
        backgroundColor = .acaiBlack
        
        titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont.avenirNextMedium.withSize(17)
        titleLabel.text = title
        self.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(titleLabelLeadingOffset)
            make.centerY.equalToSuperview()
        }
        
        priceLabel = UILabel()
        priceLabel.textColor = .white
        priceLabel.font = UIFont.avenirNextMedium.withSize(17)
        priceLabel.text = "$\(price)"
        self.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-priceLabelTrailingOffset)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
