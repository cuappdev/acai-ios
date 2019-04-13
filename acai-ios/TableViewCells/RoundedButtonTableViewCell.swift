//
//  RoundedButtonTableViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/12/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

class RoundedButtonTableViewCell: UITableViewCell {

    // MARK: Delegates
    weak var selectRoundedButtonDelegate: SelectRoundedButtonDelegate?

    // MARK: Buttons
    var loginButton: RoundedButton!
    var signUpButton: RoundedButton!

    // MARK: Constraint Constants
    private enum FileConstants {
        static let buttonHeightConstraint: CGFloat = 33
        static let buttonHorizontalSpacing = 24
        static let buttonWidthConstraint: CGFloat = 97
        static let buttonLeadingOffset = 35
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear

        signUpButton = RoundedButton(title: "Sign up", type: .action)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        contentView.addSubview(signUpButton)

        loginButton = RoundedButton(title: "Log in", type: .switchDataEntry)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        contentView.addSubview(loginButton)

        setupConstraints()
    }

    private func setupConstraints() {
        signUpButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(FileConstants.buttonLeadingOffset)
            make.bottom.equalToSuperview()
            make.height.equalTo(FileConstants.buttonHeightConstraint)
            make.width.equalTo(FileConstants.buttonWidthConstraint)
        }

        loginButton.snp.makeConstraints { make in
            make.leading.equalTo(signUpButton.snp.trailing).offset(FileConstants.buttonHorizontalSpacing)
            make.top.equalTo(signUpButton.snp.top)
            make.height.equalTo(FileConstants.buttonHeightConstraint)
            make.width.equalTo(FileConstants.buttonWidthConstraint)
        }
    }

    @objc func signUp() {
        if signUpButton.type == .switchDataEntry {
            loginButton.toggleColor()
            signUpButton.toggleColor()
            selectRoundedButtonDelegate?.switchDataEntry(to: .signUp)
        } else {
            selectRoundedButtonDelegate?.register()
        }
    }

    @objc func login() {
        if loginButton.type == .switchDataEntry {
            loginButton.toggleColor()
            signUpButton.toggleColor()
            selectRoundedButtonDelegate?.switchDataEntry(to: .login)
        } else {
            selectRoundedButtonDelegate?.login()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
