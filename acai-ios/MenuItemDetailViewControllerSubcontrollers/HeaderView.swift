//
//  HeaderView.swift
//  Chatty Cathy
//
//  Created by Artesia Ko on 2/18/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    // MARK: View vars
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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
