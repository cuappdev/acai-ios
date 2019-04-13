//
//  SignUpInputView.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/12/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import FutureNova
import SnapKit
import UIKit

class SignUpInputView: UIScrollView {

    // MARK: Input Views
    var emailInputView: InputView!
    var firstNameInputView: InputView!
    var lastNameInputView: InputView!
    var passwordInputView: InputView!
    var phoneNumberInputView: InputView!

    // MARK: Buttons
    var loginButton: RoundedButton!
    var signUpButton: RoundedButton!

    // MARK: Constraint Constants
    private enum FileConstants {
        static let buttonHeightConstraint: CGFloat = 33
        static let buttonHorizontalSpacing = 24
        static let buttonTopOffset = 25
        static let buttonWidthConstraint: CGFloat = 97
        static let inputViewHeight = 53
        static let inputViewTopOffset = 49
        static let inputViewVerticalSpacing = 25
        static let leadingOffset = 35
        static let trailingOffset = 22
    }

    enum EntryType {
        case login
        case signUp
    }

    private let networking: Networking = URLSession.shared.request

    override init(frame: CGRect) {
        super.init(frame: frame)

        firstNameInputView = InputView(type: .firstName, placeholder: "John", padding: 4)
        self.addSubview(firstNameInputView)

        lastNameInputView = InputView(type: .lastName, placeholder: "Doe", padding: 4)
        self.addSubview(lastNameInputView)

        phoneNumberInputView = InputView(type: .phoneNumber, placeholder: "8005551000", padding: 4)
        self.addSubview(phoneNumberInputView)

        emailInputView = InputView(type: .email, placeholder: "johndoe@gmail.com", padding: 4)
        self.addSubview(emailInputView)

        passwordInputView = InputView(type: .password, placeholder: "••••••••••••••", padding: 4)
        self.addSubview(passwordInputView)

        signUpButton = RoundedButton(title: "Sign up", type: .action)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        self.addSubview(signUpButton)

        loginButton = RoundedButton(title: "Log in", type: .switchDataEntry)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        self.addSubview(loginButton)

        setupConstraints()
    }

    private func setupConstraints() {
        firstNameInputView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
            make.trailing.equalToSuperview().offset(-FileConstants.trailingOffset)
            make.height.equalTo(FileConstants.inputViewHeight)
            make.top.equalTo(self.snp.top).offset(FileConstants.inputViewTopOffset)
        }

        lastNameInputView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
            make.trailing.equalToSuperview().offset(-FileConstants.trailingOffset)
            make.height.equalTo(FileConstants.inputViewHeight)
            make.top.equalTo(firstNameInputView.snp.bottom).offset(FileConstants.inputViewVerticalSpacing)
        }

        phoneNumberInputView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
            make.trailing.equalToSuperview().offset(-FileConstants.trailingOffset)
            make.height.equalTo(FileConstants.inputViewHeight)
            make.top.equalTo(lastNameInputView.snp.bottom).offset(FileConstants.inputViewVerticalSpacing)
        }

        emailInputView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
            make.trailing.equalToSuperview().offset(-FileConstants.trailingOffset)
            make.height.equalTo(FileConstants.inputViewHeight)
            make.top.equalTo(phoneNumberInputView.snp.bottom).offset(FileConstants.inputViewVerticalSpacing)
        }

        passwordInputView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
            make.trailing.equalToSuperview().offset(-FileConstants.trailingOffset)
            make.height.equalTo(FileConstants.inputViewHeight)
            make.top.equalTo(emailInputView.snp.bottom).offset(FileConstants.inputViewVerticalSpacing)
        }

        signUpButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
            make.top.equalTo(passwordInputView.snp.bottom).offset(FileConstants.buttonTopOffset)
            make.height.equalTo(FileConstants.buttonHeightConstraint)
            make.width.equalTo(FileConstants.buttonWidthConstraint)
        }

        loginButton.snp.makeConstraints { make in
            make.leading.equalTo(signUpButton.snp.trailing).offset(FileConstants.buttonHorizontalSpacing)
            make.top.equalTo(passwordInputView.snp.bottom).offset(FileConstants.buttonTopOffset)
            make.height.equalTo(FileConstants.buttonHeightConstraint)
            make.width.equalTo(FileConstants.buttonWidthConstraint)
        }
    }

    func switchDataEntry(to type: EntryType) {
        if type == .login {
            emailInputView.snp.remakeConstraints { make in
                make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
                make.trailing.equalToSuperview().offset(-FileConstants.trailingOffset)
                make.height.equalTo(FileConstants.inputViewHeight)
                make.top.equalTo(self.snp.top).offset(FileConstants.inputViewTopOffset)
            }
            firstNameInputView.isHidden = true
            lastNameInputView.isHidden = true
            phoneNumberInputView.isHidden = true
        } else {
            firstNameInputView.isHidden = false
            lastNameInputView.isHidden = false
            phoneNumberInputView.isHidden = false
            emailInputView.snp.remakeConstraints { make in
                make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
                make.trailing.equalToSuperview().offset(-FileConstants.trailingOffset)
                make.height.equalTo(FileConstants.inputViewHeight)
                make.top.equalTo(phoneNumberInputView.snp.bottom).offset(FileConstants.inputViewVerticalSpacing)
            }
        }
    }

    @objc func signUp() {
        if signUpButton.type == .switchDataEntry {
            loginButton.toggleColor()
            signUpButton.toggleColor()
            switchDataEntry(to: .signUp)
        } else {
            guard let email = emailInputView.textField.text,
                let firstName = firstNameInputView.textField.text,
                let lastName = lastNameInputView.textField.text,
                let password = passwordInputView.textField.text,
                let phoneNumber = phoneNumberInputView.textField.text else { return }
            emailInputView.invalidEntryLabel.isHidden = email.isValidEmail()
            firstNameInputView.invalidEntryLabel.isHidden = firstName.isValidName()
            lastNameInputView.invalidEntryLabel.isHidden = lastName.isValidName()
            passwordInputView.invalidEntryLabel.isHidden = password.isValidPassword()
            phoneNumberInputView.invalidEntryLabel.isHidden = phoneNumber.isValidPhoneNumber()
            if email.isValidEmail() && firstName.isValidName() && lastName.isValidName() && password.isValidPassword() && phoneNumber.isValidPhoneNumber() {
                createUser(email: email, firstName: firstName, lastName: lastName, password: password, phoneNumber: phoneNumber)
            }
        }
    }

    @objc func login() {
        if loginButton.type == .switchDataEntry {
            loginButton.toggleColor()
            signUpButton.toggleColor()
            switchDataEntry(to: .login)
        } else {
            guard let email = emailInputView.textField.text, let password = passwordInputView.textField.text else { return }
            emailInputView.invalidEntryLabel.isHidden = email.isValidEmail()
            passwordInputView.invalidEntryLabel.isHidden = password != ""
            if email.isValidEmail() && password.isValidPassword() {
                getUser(email: email, password: password).observe { (result) in
                    switch result {
                    case .value(let response):
                        print(response)
                    case .error(let error):
                        print(error)
                    }
                }
            }
        }
    }

    private func getUser(email: String, password: String) -> Future<User> {
        return networking(Endpoint.login(email: email, password: password)).decode()
    }

    private func createUser(email: String, firstName: String, lastName: String, password: String, phoneNumber: String) {
        networking(Endpoint.register(firstName: firstName, lastName: lastName, email: email, password: password, phoneNumber: phoneNumber))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
