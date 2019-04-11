//
//  LoginViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 2/27/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit
import FutureNova

class LoginViewController: UIViewController {
    
    // MARK: Input Views
    var emailInputView: InputView!
    var nameInputView: InputView!
    var passwordInputView: InputView!
    
    // MARK: Buttons
    var loginButton: RoundedButton!
    var signUpButton: RoundedButton!
    
    // MARK: Constraint Constants
    private enum FileConstants {
        static let buttonHeightConstraint: CGFloat = 33
        static let buttonHorizontalSpacing = 24
        static let buttonTopOffset = 16
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
    
    private struct User: Codable {
        let email: String
        let password: String
    }
    
    private let networking: Networking = URLSession.shared.request
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let navigationTitleLabel = UILabel()
        navigationTitleLabel.text = "Account"
        navigationTitleLabel.font = UIFont.avenirNextMedium.withSize(24)
        navigationTitleLabel.sizeToFit()
        let navigationBarLeftItem = UIBarButtonItem(customView: navigationTitleLabel)
        self.navigationItem.leftBarButtonItem = navigationBarLeftItem
        //title = "Account"
        formatNavigationBar()

        nameInputView = InputView(frame: .zero, type: .name, placeholder: "John Doe", padding: 4)
        view.addSubview(nameInputView)
        
        emailInputView = InputView(frame: .zero, type: .email, placeholder: "johndoe@gmail.com", padding: 4)
        view.addSubview(emailInputView)
        
        passwordInputView = InputView(frame: .zero, type: .password, placeholder: "••••••••••••••", padding: 4)
        view.addSubview(passwordInputView)
        
        signUpButton = RoundedButton(frame: .zero, title: "Sign up", type: .action)
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        view.addSubview(signUpButton)
        
        loginButton = RoundedButton(frame: .zero, title: "Log in", type: .switchDataEntry)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        view.addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameInputView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
            make.trailing.equalToSuperview().offset(-FileConstants.trailingOffset)
            make.height.equalTo(FileConstants.inputViewHeight)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(FileConstants.inputViewTopOffset)
        }
        
        emailInputView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
            make.trailing.equalToSuperview().offset(-FileConstants.trailingOffset)
            make.height.equalTo(FileConstants.inputViewHeight)
            make.top.equalTo(nameInputView.snp.bottom).offset(FileConstants.inputViewVerticalSpacing)
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
    
    private func formatNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .compact)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .navigationWhite
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.avenirNextMedium.withSize(24),
            .foregroundColor: UIColor.black
        ]
    }
    
    func switchDataEntry(to type: EntryType) {
        if type == .login {
            emailInputView.snp.remakeConstraints { make in
                make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
                make.trailing.equalToSuperview().offset(-FileConstants.trailingOffset)
                make.height.equalTo(FileConstants.inputViewHeight)
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(FileConstants.inputViewTopOffset)
            }
            nameInputView.isHidden = true
        } else {
            nameInputView.isHidden = false
            emailInputView.snp.remakeConstraints { make in
                make.leading.equalToSuperview().offset(FileConstants.leadingOffset)
                make.trailing.equalToSuperview().offset(-FileConstants.trailingOffset)
                make.height.equalTo(FileConstants.inputViewHeight)
                make.top.equalTo(nameInputView.snp.bottom).offset(FileConstants.inputViewVerticalSpacing)
            }
        }
    }
    
    @objc func signUp() {
        if signUpButton.type == .switchDataEntry {
            loginButton.toggleColor()
            signUpButton.toggleColor()
            switchDataEntry(to: .signUp)
        } else {
            print("pressed sign up button")
        }
    }
    
    @objc func login() {
        if loginButton.type == .switchDataEntry {
            loginButton.toggleColor()
            signUpButton.toggleColor()
            switchDataEntry(to: .login)
        } else {
            print("pressed log in button")
            if let email = emailInputView.textField.text, let password = passwordInputView.textField.text, email != "", password != "" {
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
    
}
