//
//  DetailTextCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/6/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

class DetailTextCollectionViewCell: UICollectionViewCell {
    
    // MARK: View vars
    var textBox: UITextView!
    var titleLabel: UILabel!
    var priceLabel: UILabel!
    var line: UIView!
    
    var customizationOptions: [CustomizationOption]!
    
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
        textBox.text = ""
        textBox.isScrollEnabled = false
        self.addSubview(textBox)
        textBox.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
        
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
        
        customizationOptions = Acai.customizationOptions
        setDetailText()
    }
    
    func setDetailText() {
        for option in customizationOptions {
            for subOption in option.options {
                if (subOption.isSelected) {
                    if let text = textBox.text {
                        if text == "" {
                            textBox.text = "\(subOption.title)"
                        }
                        else {
                            textBox.text = "\(text), \(subOption.title)"
                        }
                    }
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
