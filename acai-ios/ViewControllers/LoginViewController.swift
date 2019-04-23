//
//  LoginViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 2/27/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import FutureNova
import SnapKit
import UIKit

protocol SelectRoundedButtonDelegate: class {
    func register()
    func login()
    func switchDataEntry(to type: EntryType)
}

protocol ChangeInputTextFieldDelegate: class {
    func changeText(text: String, type: InputType)
}

enum EntryType {
    case login
    case signUp
}

class LoginViewController: UITableViewController {

    // MARK: Constants
    private enum FileConstants {
        // MARK: Reuse identifiers
        static let roundedButtonCellReuseIdentifier = "roundedButtonCellReuseIdentifier"
        static let inputCellReuseIdentifier = "inputCellReuseIdentifier"
        static let textCellReuseIdentifier = "textCellReuseIdentifier"

        // MARK: Constraint constants
        static let buttonCellHeight: CGFloat = 50
        static let inputViewBottomOffset: CGFloat = 10
        static let inputViewHeight: CGFloat = 75
        static let inputViewTopOffset: CGFloat = 49
    }

    // MARK: Data
    var inputItems: [UserInputItem] = [
        UserInputItem(type: .firstName),
        UserInputItem(type: .lastName),
        UserInputItem(type: .phoneNumber),
        UserInputItem(type: .email),
        UserInputItem(type: .password)
    ]
    var email: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var password: String = ""
    var phoneNumber: String = ""
    var labelText: String = ""

    var attemptedNetworking = false

    private let networking: Networking = URLSession.shared.request

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        formatNavigationBar()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.contentInset.top = FileConstants.inputViewTopOffset
        tableView.contentInset.bottom = FileConstants.inputViewBottomOffset
        tableView.register(InputTableViewCell.self, forCellReuseIdentifier: FileConstants.inputCellReuseIdentifier)
        tableView.register(RoundedButtonTableViewCell.self, forCellReuseIdentifier: FileConstants.roundedButtonCellReuseIdentifier)
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: FileConstants.textCellReuseIdentifier)
    }

    private func formatNavigationBar() {
        let navigationTitleLabel = UILabel()
        navigationTitleLabel.text = "Account"
        navigationTitleLabel.font = UIFont.avenirNextMedium.withSize(24)
        navigationTitleLabel.sizeToFit()
        let navigationBarTitleItem = UIBarButtonItem(customView: navigationTitleLabel)
        let navigationBarBackButton = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .done, target: self, action: #selector(backButtonPressed))
        self.navigationItem.leftBarButtonItems = [
            navigationBarBackButton,
            navigationBarTitleItem
        ]
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.setBackgroundImage(nil, for: .compact)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .navigationWhite
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.titleTextAttributes = [
            .font: UIFont.avenirNextMedium.withSize(24),
            .foregroundColor: UIColor.black
        ]
    }

    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // +1 for cell with sign up and login buttons
        // +1 for label text
        return inputItems.count + 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == inputItems.count + 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FileConstants.roundedButtonCellReuseIdentifier, for: indexPath) as! RoundedButtonTableViewCell
            cell.selectRoundedButtonDelegate = self
            return cell
        } else if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FileConstants.textCellReuseIdentifier, for: indexPath) as! TextTableViewCell
            cell.configure(for: labelText)
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FileConstants.inputCellReuseIdentifier, for: indexPath) as! InputTableViewCell
            let inputItem = inputItems[indexPath.row - 1]
            cell.changeInputTextFieldDelegate = self
            cell.invalidEntryLabel.isHidden = true
            if let type = inputItem.type {
                switch type {
                case .email:
                    cell.textField.text = email
                    if attemptedNetworking {
                        cell.invalidEntryLabel.isHidden = email.isValidEmail()
                    }
                case .firstName:
                    cell.textField.text = firstName
                    if attemptedNetworking {
                        cell.invalidEntryLabel.isHidden = firstName.isValidName()
                    }
                case .lastName:
                    cell.textField.text = lastName
                    if attemptedNetworking {
                        cell.invalidEntryLabel.isHidden = lastName.isValidName()
                    }
                case .password:
                    cell.textField.text = password
                    if attemptedNetworking {
                        cell.invalidEntryLabel.isHidden = password.isValidPassword()
                    }
                case .phoneNumber:
                    cell.textField.text = phoneNumber
                    if attemptedNetworking {
                        cell.invalidEntryLabel.isHidden = phoneNumber.isValidPhoneNumber()
                    }
                }
            }
            cell.configure(for: inputItem)
            return cell
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let labelBottomPadding: CGFloat = 36
        if indexPath.row == inputItems.count + 1 {
            return FileConstants.buttonCellHeight
        } else if indexPath.row == 0 {
            // subtract 35*2 for leading and trailing padding of label in TextTableViewCell
            return labelText == "" ? 0 : labelText.height(withConstrainedWidth: tableView.frame.width - 35*2, font: UIFont.avenirNextMedium.withSize(17)) + labelBottomPadding

        } else {
            return FileConstants.inputViewHeight
        }
    }

    func resetTextFields() {
        email = ""
        firstName = ""
        lastName = ""
        password = ""
        phoneNumber = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension LoginViewController: SelectRoundedButtonDelegate {
    func register() {
        attemptedNetworking = true
        guard let firstNameCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? InputTableViewCell,
            let lastNameCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? InputTableViewCell,
            let phoneNumberCell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? InputTableViewCell,
            let emailCell = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? InputTableViewCell,
            let passwordCell = tableView.cellForRow(at: IndexPath(row: 4, section: 0)) as? InputTableViewCell else { return }
        firstNameCell.invalidEntryLabel.isHidden = firstName.isValidName()
        lastNameCell.invalidEntryLabel.isHidden = lastName.isValidName()
        phoneNumberCell.invalidEntryLabel.isHidden = phoneNumber.isValidPhoneNumber()
        emailCell.invalidEntryLabel.isHidden = email.isValidEmail()
        passwordCell.invalidEntryLabel.isHidden = password.isValidPassword()
        if email.isValidEmail() && firstName.isValidName() && lastName.isValidName() && password.isValidPassword() && phoneNumber.isValidPhoneNumber() {
            createUser(email: email, firstName: firstName, lastName: lastName, password: password, phoneNumber: phoneNumber).observe { [weak self] result in
                switch result {
                case .value(let value):
                    print(value)
                case .error(let error):
                    print(error)
                }
            }
        }
    }

    func login() {
        attemptedNetworking = true
        guard let emailCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? InputTableViewCell,
            let passwordCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? InputTableViewCell else { return }
        emailCell.invalidEntryLabel.isHidden = email.isValidEmail()
        passwordCell.invalidEntryLabel.isHidden = password != ""
        if email.isValidEmail() && password.isValidPassword() {
            getUser(email: email, password: password).observe { [weak self] result in
                switch result {
                case .value(let response):
                    print(response)
                case .error(let error):
                    print(error)
                }
            }
        }
    }

    private func getUser(email: String, password: String) -> Future<Response<User>> {
        return networking(Endpoint.login(email: email, password: password)).decode()
    }

    private func createUser(email: String, firstName: String, lastName: String, password: String, phoneNumber: String) -> Future<Response<User>> {
        return networking(Endpoint.register(firstName: firstName, lastName: lastName, email: email, password: password, phoneNumber: phoneNumber)).decode()
    }

    func switchDataEntry(to type: EntryType) {
        attemptedNetworking = false
        switch type {
        case .login:
            inputItems = [
                UserInputItem(type: .email),
                UserInputItem(type: .password)
            ]
        case .signUp:
            inputItems = [
                UserInputItem(type: .firstName),
                UserInputItem(type: .lastName),
                UserInputItem(type: .phoneNumber),
                UserInputItem(type: .email),
                UserInputItem(type: .password)
            ]
        }
        resetTextFields()
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .middle, animated: false)
    }
}

extension LoginViewController: ChangeInputTextFieldDelegate {
    func changeText(text: String, type: InputType) {
        switch type {
        case .email:
            email = text
        case .firstName:
            firstName = text
        case .lastName:
            lastName = text
        case .password:
            password = text
        case .phoneNumber:
            phoneNumber = text
        }
    }
}
