//
//  QuantitySelectionCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

protocol QuantitySelectionCollectionViewCellDelegate: class {
    func valueIncremented()
    func valueDecremented()
}

class QuantitySelectionCollectionViewCell: UICollectionViewCell {

    // MARK: View vars
    var addButton: UIButton!
    var border: UIView!
    var quantityLabel: UILabel!
    var subtractButton: UIButton!

    // MARK: Delegate
    weak var delegate: QuantitySelectionCollectionViewCellDelegate?

    // MARK: Constraint constants
    private enum FileConstants {
        static let borderHeight = 50
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        border = UIView()
        border.backgroundColor = .clear
        border.layer.borderColor = UIColor.lineGray.cgColor
        border.layer.borderWidth = 1
        border.layer.cornerRadius = CGFloat(FileConstants.borderHeight / 2)
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
        let borderWidth = 217
        let buttonHeightWidth = 40
        let buttonOffsetFromLabel = 8
        let quantityLabelWidth = 121

        border.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(FileConstants.borderHeight)
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
        delegate?.valueIncremented()
    }

    @objc func decrementQuantity() {
        delegate?.valueDecremented()
    }

    func configure(for quantity: NSNumber, and itemType: MenuItem.ItemType) {
        if quantity.intValue > 1 {
            // Plural
            quantityLabel.text = "\(quantity) \(itemType.plural())"
        } else {
            quantityLabel.text = "\(quantity) \(itemType.rawValue)"
        }
        if quantity.intValue == 1 {
            subtractButton.tintColor = .lineGray
        } else {
            subtractButton.tintColor = .acaiBlack
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
