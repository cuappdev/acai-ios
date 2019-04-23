//
//  InputTableViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/12/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

class InputTableViewCell: UITableViewCell {

    // MARK: Delegates
    weak var changeInputTextFieldDelegate: ChangeInputTextFieldDelegate?

    // MARK: View vars
    var label: UILabel!
    var line: UIView!
    var invalidEntryLabel: UILabel!
    var textField: UITextField!

    // MARK: Constraint Constants
    private enum FileConstants {

    }

    // MARK: Data
    var type: InputType!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear

        label = UILabel()
        label.textColor = .acaiBlack
        label.font = UIFont.avenirNextDemi.withSize(17)
        contentView.addSubview(label)

        textField = UITextField()
        textField.font = UIFont.avenirNextRegular.withSize(14)
        textField.textColor = .paleOrange
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(changedText), for: .editingChanged)
        contentView.addSubview(textField)

        line = UIView()
        line.backgroundColor = .lineGray
        contentView.addSubview(line)

        invalidEntryLabel = UILabel()
        invalidEntryLabel.textColor = .scarlet
        invalidEntryLabel.font = UIFont.avenirNextRegular.withSize(11)
        invalidEntryLabel.isHidden = true
        contentView.addSubview(invalidEntryLabel)

        setupConstraints()
    }

    func configure(for inputItem: UserInputItem) {
        guard let type = inputItem.type else { return }
        let placeholder = inputItem.type.placeholder()
        let attr: [NSAttributedString.Key: Any] = [
            .font: UIFont.avenirNextRegular.withSize(14),
            .foregroundColor: UIColor.placeholderGray
        ]
        self.type = type
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attr)
        label.text = type.rawValue
        invalidEntryLabel.text = "Invalid \(type.rawValue.lowercased()) entered"
        switch type {
        case .email:
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = false
            textField.keyboardType = .emailAddress
        case .firstName:
            textField.autocapitalizationType = .words
            textField.isSecureTextEntry = false
            textField.keyboardType = .alphabet
        case .lastName:
            textField.autocapitalizationType = .words
            textField.isSecureTextEntry = false
            textField.keyboardType = .alphabet
        case .password:
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = true
            textField.keyboardType = .default
        case .phoneNumber:
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = false
            textField.keyboardType = .phonePad
        case .cardHolder:
            textField.autocapitalizationType = .words
            textField.isSecureTextEntry = false
            textField.keyboardType = .alphabet
        case .cardNumber:
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = false
            textField.keyboardType = .numberPad
        case .cvc:
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = false
            textField.keyboardType = .numberPad
        case .expirationDate:
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = false
            textField.keyboardType = .numberPad
        }
    }

    private func setupConstraints() {
        let lineHeight = 1
        let leadingOffset = 35
        let trailingOffset = 22
        let verticalOffset = 4
        invalidEntryLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingOffset)
            make.trailing.equalToSuperview().offset(-trailingOffset)
            make.bottom.equalToSuperview()
        }

        line.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingOffset)
            make.trailing.equalToSuperview().offset(-trailingOffset)
            make.height.equalTo(lineHeight)
            make.bottom.equalTo(invalidEntryLabel.snp.top).offset(-verticalOffset)
        }

        textField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingOffset)
            make.trailing.equalToSuperview().offset(-trailingOffset)
            make.bottom.equalTo(line.snp.top).offset(-verticalOffset)
        }

        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingOffset)
            make.trailing.equalToSuperview().offset(-trailingOffset)
            make.bottom.equalTo(textField.snp.top).offset(-verticalOffset)
        }
    }

    @objc func changedText() {
        changeInputTextFieldDelegate?.changeText(text: textField.text ?? "", type: type)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
