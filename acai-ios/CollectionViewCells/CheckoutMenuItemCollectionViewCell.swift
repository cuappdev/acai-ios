//
//  CheckoutMenuItemCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/12/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

class CheckoutMenuItemCollectionViewCell: UICollectionViewCell {
    
    var menuItemTitleLabel: UILabel!
    var menuItemPriceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        menuItemTitleLabel = UILabel()
        menuItemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        menuItemTitleLabel.text = ""
        menuItemTitleLabel.font = Acai.avenirNextMedium
        menuItemTitleLabel.textColor = .black
        self.addSubview(menuItemTitleLabel)
        menuItemTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
        }
        
        menuItemPriceLabel = UILabel()
        menuItemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        menuItemPriceLabel.text = ""
        menuItemPriceLabel.font = Acai.avenirNextMedium
        menuItemPriceLabel.textColor = .black
        self.addSubview(menuItemPriceLabel)
        menuItemPriceLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-18)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
