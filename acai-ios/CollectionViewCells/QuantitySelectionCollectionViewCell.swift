//
//  QuantitySelectionCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class QuantitySelectionCollectionViewCell: UICollectionViewCell {
    
    // MARK: View vars
    var addButton: UIButton!
    var border: UIView!
    var quantityLabel: UILabel!
    var subtractButton: UIButton!
    
    // MARK: Data
    var menuItem: MenuItem!
    var quantity: Int = 1
    
    // MARK: Constraint constants
    let borderHeight = 50
    let borderWidth = 217
    let buttonHeightWidth = 14
    let buttonOffsetFromLabel = 17
    let quantityLabelWidth = 121
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        border = UIView()
        border.backgroundColor = .clear
        border.layer.borderColor = UIColor.lineGray.cgColor
        border.layer.borderWidth = 1
        border.layer.cornerRadius = CGFloat(borderHeight/2)
        contentView.addSubview(border)
        
        quantityLabel = UILabel()
        quantityLabel.textColor = .acaiBlack
        quantityLabel.font = UIFont.avenirNextDemi.withSize(20)
        quantityLabel.textAlignment = .center
        contentView.addSubview(quantityLabel)
        
        addButton = UIButton(type: .system)
        addButton.tintColor = .acaiBlack
        addButton.setImage(UIImage(named: "plusIcon"), for: .normal)
        addButton.contentMode = .scaleAspectFit
        addButton.addTarget(self, action: #selector(incrementQuantity), for: .touchUpInside)
        contentView.addSubview(addButton)
        
        subtractButton = UIButton(type: .system)
        subtractButton.tintColor = .acaiBlack
        subtractButton.setImage(UIImage(named: "minusIcon"), for: .normal)
        subtractButton.contentMode = .scaleAspectFit
        subtractButton.addTarget(self, action: #selector(decrementQuantity), for: .touchUpInside)
        contentView.addSubview(subtractButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        border.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(borderHeight)
            make.width.equalTo(borderWidth)
        }
        
        quantityLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(quantityLabelWidth)
        }
        
        addButton.snp.makeConstraints { make in
            make.height.width.equalTo(buttonHeightWidth)
            make.leading.equalTo(quantityLabel.snp.trailing).offset(buttonOffsetFromLabel)
            make.centerY.equalToSuperview()
        }
        
        subtractButton.snp.makeConstraints { make in
            make.height.width.equalTo(buttonHeightWidth)
            make.trailing.equalTo(quantityLabel.snp.leading).offset(-buttonOffsetFromLabel)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func incrementQuantity() {
        if let menuItem = menuItem {
            self.quantity = quantity + 1
            updateQuantityLabelText(menuItem: menuItem)
        }
    }
    
    @objc func decrementQuantity() {
        if let menuItem = menuItem, quantity > 1 {
            self.quantity = quantity - 1
            updateQuantityLabelText(menuItem: menuItem)
        }
    }
    
    func updateQuantityLabelText(menuItem: MenuItem) {
        switch menuItem.type {
        case .bowl:
            quantityLabel.text = "\(quantity) Bowl"
        case .drink, .smoothie:
            quantityLabel.text = "\(quantity) Cup"
        }
        if let text = quantityLabel.text, quantity != 1 {
            quantityLabel.text = "\(text)s"
        }
        if quantity == 1 {
            subtractButton.tintColor = .lineGray
        } else {
            subtractButton.tintColor = .acaiBlack
        }
    }
    
    func configure(menuItem: MenuItem) {
        self.menuItem = menuItem
        updateQuantityLabelText(menuItem: menuItem)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
