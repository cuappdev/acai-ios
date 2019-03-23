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
    
    // MARK: View vars
    var emailTextField: UITextField!
    var loginButton: UIButton!
    var passwordTextField: UITextField!
    
    // MARK: Constraint Constants
    let leadingTrailingOffset = 20
    let loginButtonHeightConstraint: CGFloat = 50
    
    private struct User: Codable {
        let email: String
        let password: String
    }
    
    private let networking: Networking = URLSession.shared.request
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        emailTextField = UITextField()
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: 27, weight: .regular)
        emailTextField.placeholder = "Email"
        emailTextField.keyboardType = .emailAddress
        view.addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.centerY).offset(-10)
            make.leading.equalToSuperview().offset(leadingTrailingOffset)
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
        }
        
        passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 27, weight: .regular)
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY).offset(10)
            make.leading.equalToSuperview().offset(leadingTrailingOffset)
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
        }

        loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = .black
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(leadingTrailingOffset)
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
            make.height.equalTo(loginButtonHeightConstraint)
        }
    }
    
    @objc func login() {
        if let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" {
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
    
    private func getUser(email: String, password: String) -> Future<User> {
        return networking(Endpoint.login(email: email, password: password)).decode()
    }
    
}