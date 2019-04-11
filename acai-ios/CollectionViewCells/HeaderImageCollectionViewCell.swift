//
//  BowlHeaderCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/21/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

class HeaderImageCollectionViewCell: UICollectionViewCell {

    // MARK: View vars
    var imageView: UIImageView!

    // MARK: Constraint Constants
    private enum FileConstants {
        static let imageViewHeightWidth: CGFloat = 206
        static let imageViewTopOffset: CGFloat = 15
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = FileConstants.imageViewHeightWidth / 2.0
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)

        setupConstraints()
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(FileConstants.imageViewTopOffset)
            make.height.width.equalTo(FileConstants.imageViewHeightWidth)
        }
    }

    func configure(for menuItem: MenuItem) {
        imageView.image = menuItem.image
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
