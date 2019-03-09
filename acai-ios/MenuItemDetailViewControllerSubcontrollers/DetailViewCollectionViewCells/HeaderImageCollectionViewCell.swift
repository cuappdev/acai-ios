//
//  HeaderViewCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/7/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

class HeaderImageCollectionViewCell: UICollectionViewCell {
    
    // MARK: View vars
    var dismissButton: UIButton!
    var imageView: UIImageView!
    
    // MARK: View initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        dismissButton = UIButton(type: .system)
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.backgroundColor = .clear
        dismissButton.setImage(UIImage(named: "x_icon"), for: .normal)
        dismissButton.contentMode = .scaleAspectFit
        dismissButton.tintColor = .acaiDarkGray
        dismissButton.addTarget(self, action: #selector(dismissMenuItemDetailViewController), for: .touchUpInside)
        self.addSubview(dismissButton)
        dismissButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(18)
            make.leading.equalToSuperview().offset(18)
            make.height.equalTo(23)
            make.width.equalTo(23)
        }
    }
    
    @objc func dismissMenuItemDetailViewController() {
        //dismiss(animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
