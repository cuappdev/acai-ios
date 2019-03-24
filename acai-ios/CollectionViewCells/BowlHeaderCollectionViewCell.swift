//
//  BowlHeaderCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/21/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class BowlHeaderCollectionViewCell: UICollectionViewCell {
    
    // MARK: View vars
    var bowlImageView: UIImageView!
    
    // MARK: Constraint Constants
    let bowlImageViewHeightWidth = 206
    let bowlImageViewTopOffset = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bowlImageView = UIImageView()
        bowlImageView.backgroundColor = .clear
        bowlImageView.contentMode = .scaleAspectFit
        bowlImageView.layer.cornerRadius = CGFloat(bowlImageViewHeightWidth/2)
        bowlImageView.layer.masksToBounds = true
        contentView.addSubview(bowlImageView)

        setupConstraints()
    }
    
    private func setupConstraints() {
        bowlImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(bowlImageViewTopOffset)
            make.height.width.equalTo(bowlImageViewHeightWidth)
        }
    }
    
    func configure(for bowlItem: MenuItem) {
        bowlImageView.image = bowlItem.image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
