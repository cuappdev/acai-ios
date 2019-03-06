//
//  TextView.swift
//  Chatty Cathy
//
//  Created by Artesia Ko on 2/18/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class DetailTextView: UIView {
    
    // MARK: View vars
    var textBox: UITextView!
    var titleLabel: UILabel!
    var priceLabel: UILabel!

    // MARK: View initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        titleLabel.textColor = .black
        titleLabel.text = "Item Name"
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        priceLabel.textColor = Acai.lightGray
        priceLabel.text = "$XX.XX"
        priceLabel.textAlignment = .right
        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.firstBaseline.equalTo(titleLabel.snp.firstBaseline)
            make.trailing.equalToSuperview()
        }
        
        textBox = UITextView()
        textBox.translatesAutoresizingMaskIntoConstraints = false
        textBox.isEditable = false
        textBox.showsVerticalScrollIndicator = false
        textBox.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textBox.textColor = Acai.medGray
        textBox.text = "DetailTextView TextBox"
        self.addSubview(textBox)
        textBox.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
