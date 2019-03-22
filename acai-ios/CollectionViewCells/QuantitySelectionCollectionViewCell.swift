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
    var quantityLabel: UILabel!
    var subtractButton: UIButton!
    
    // MARK: Data
    var object: Any!
    var quantity: Int = 1
    
    // MARK: Constraint constants
    let buttonHeightWidth = 28
    let buttonOffsetFromLabel = 20
    let quantityLabelWidth = 121
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        quantityLabel = UILabel()
        quantityLabel.textColor = .acaiBlack
        quantityLabel.font = UIFont.avenirNextDemi.withSize(20)
        quantityLabel.textAlignment = .center
        contentView.addSubview(quantityLabel)
        
        quantityLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(quantityLabelWidth)
        }
        
        addButton = UIButton(type: .system)
        addButton.tintColor = .acaiBlack
        addButton.setImage(UIImage(), for: .normal)
        addButton.contentMode = .scaleAspectFit
        addButton.addTarget(self, action: #selector(incrementQuantity), for: .touchUpInside)
        contentView.addSubview(addButton)
        
        addButton.snp.makeConstraints { make in
            make.height.width.equalTo(buttonHeightWidth)
            make.leading.equalTo(quantityLabel.snp.trailing).offset(buttonOffsetFromLabel)
            make.centerY.equalToSuperview()
        }
        
        subtractButton = UIButton(type: .system)
        subtractButton.tintColor = .acaiBlack
        subtractButton.setImage(UIImage(), for: .normal)
        subtractButton.contentMode = .scaleAspectFit
        subtractButton.addTarget(self, action: #selector(decrementQuantity), for: .touchUpInside)
        contentView.addSubview(subtractButton)
        
        subtractButton.snp.makeConstraints { make in
            make.height.width.equalTo(buttonHeightWidth)
            make.trailing.equalTo(quantityLabel.snp.leading).offset(-buttonOffsetFromLabel)
            make.centerY.equalToSuperview()
        }

    }
    
    @objc func incrementQuantity() {
        if let object = object {
            self.quantity = quantity + 1
            updateQuantityLabelText(object: object)
        }
    }
    
    @objc func decrementQuantity() {
        if let object = object, quantity > 1 {
            self.quantity = quantity - 1
            updateQuantityLabelText(object: object)
        }
    }
    
    func updateQuantityLabelText(object: Any) {
        if object is BowlItem {
            quantityLabel.text = "\(quantity) Bowl"
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
    
    func configure(object: Any) {
        self.object = object
        updateQuantityLabelText(object: object)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
