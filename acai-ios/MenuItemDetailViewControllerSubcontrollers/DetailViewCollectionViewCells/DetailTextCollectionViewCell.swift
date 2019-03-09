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
    
    var menuItem: MenuItem!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = Acai.avenirNextDemi.withSize(26)
        titleLabel.textColor = .black
        titleLabel.text = ""
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalTo(titleLabel.snp.trailing)
        }
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = Acai.avenirNextMedium.withSize(20)
        priceLabel.textColor = .black
        priceLabel.text = "$XX.XX"
        priceLabel.textAlignment = .right
        self.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(28)
            make.trailing.equalToSuperview().offset(-18)
            make.leading.equalTo(titleLabel.snp.trailing).offset(20)
        }
        
        textBox = UITextView()
        textBox.translatesAutoresizingMaskIntoConstraints = false
        textBox.isEditable = false
        textBox.showsVerticalScrollIndicator = false
        textBox.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textBox.textColor = .acaiMedGray
        textBox.text = ""
        textBox.isScrollEnabled = false
        self.addSubview(textBox)
        textBox.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview().offset(-18)
        }
        
        line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .lineGray
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-36)
            make.height.equalTo(1)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setDetailText(menuItem: MenuItem) {
        self.menuItem = menuItem
        textBox.text = menuItem.getSelectedSubOptionsText()
        priceLabel.text = "$\(menuItem.basePrice)"
        titleLabel.text = menuItem.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
