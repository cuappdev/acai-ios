//
//  ButtonCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/6/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class ButtonCollectionViewCell: UICollectionViewCell {
    
    var button: UIButton!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.setTitleColor(Acai.lightGray, for: .normal)
        button.titleLabel?.font = Acai.avenirNextMedium.withSize(20)
        self.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
