//
//  BowlHeaderCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/21/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class HeaderImageCollectionViewCell: UICollectionViewCell {
    
    // MARK: View vars
    var imageView: UIImageView!
    
    // MARK: Constraint Constants
    let imageViewHeightWidth = 206
    let imageViewTopOffset = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = CGFloat(imageViewHeightWidth/2)
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)

        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(imageViewTopOffset)
            make.height.width.equalTo(imageViewHeightWidth)
        }
    }
    
    func configure(for menuItem: MenuItem) {
        imageView.image = menuItem.image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
