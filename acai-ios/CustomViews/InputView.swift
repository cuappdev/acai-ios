//
//  InputView.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/10/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

class InputView: UIView {

    // MARK: View vars
    var label: UILabel!
    var line: UIView!
    var textField: UITextField!

    // MARK: Constraint Constants
    private enum FileConstants {
        static let lineHeight = 1
    }

    enum InputType: String {
        case email = "Email"
        case name = "Name"
        case password = "Password"
    }

    init(frame: CGRect, type: InputType, placeholder: String, padding: CGFloat) {
        super.init(frame: frame)
        backgroundColor = .clear

        label = UILabel()
        label.textColor = .acaiBlack
        label.font = UIFont.avenirNextDemi.withSize(17)
        label.text = type.rawValue
        self.addSubview(label)

        textField = UITextField()
        textField.font = UIFont.avenirNextRegular.withSize(14)
        textField.textColor = .paleOrange
        let attr: [NSAttributedString.Key: Any] = [
            .font: UIFont.avenirNextRegular.withSize(14),
            .foregroundColor: UIColor.placeholderGray
        ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attr)
        switch type {
        case .email:
            textField.autocapitalizationType = .none
            textField.keyboardType = .emailAddress
        case .name:
            textField.autocapitalizationType = .words
        case .password:
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = true
        }
        self.addSubview(textField)

        line = UIView()
        line.backgroundColor = .lineGray
        self.addSubview(line)

        setupConstraints(padding: padding)
    }

    private func setupConstraints(padding: CGFloat) {
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview()
        }

        textField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(padding)
        }

        line.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(FileConstants.lineHeight)
            make.top.equalTo(textField.snp.bottom).offset(padding)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
