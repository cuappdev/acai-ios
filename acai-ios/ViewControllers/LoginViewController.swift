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

enum EntryType {
    case login
    case signUp
}

class LoginViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: View vars
    var tableView: UITableView!

    // MARK: Constants
    private enum FileConstants {
        // MARK: Reuse identifiers
        static let roundedButtonCellReuseIdentifier = "roundedButtonCellReuseIdentifier"
        static let inputCellReuseIdentifier = "inputCellReuseIdentifier"

        // MARK: Constraint constants
        static let buttonCellHeight: CGFloat = 50
        static let inputViewBottomOffset: CGFloat = 100
        static let inputViewHeight: CGFloat = 78
        static let inputViewTopOffset: CGFloat = 49
    }

    // MARK: Data
    var inputItems: [InputItem] = [
        InputItem(type: .firstName),
        InputItem(type: .lastName),
        InputItem(type: .phoneNumber),
        InputItem(type: .email),
        InputItem(type: .password)
    ]

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
        formatNavigationBar()

        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.contentInset.top = FileConstants.inputViewTopOffset
        tableView.contentInset.bottom = FileConstants.inputViewBottomOffset
        tableView.register(InputTableViewCell.self, forCellReuseIdentifier: FileConstants.inputCellReuseIdentifier)
        tableView.register(RoundedButtonTableViewCell.self, forCellReuseIdentifier: FileConstants.roundedButtonCellReuseIdentifier)
        view.addSubview(tableView)

        setupConstraints()
        setupKeyboard()
    }

    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputItems.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = indexPath.row == inputItems.count ? tableView.dequeueReusableCell(withIdentifier: FileConstants.roundedButtonCellReuseIdentifier, for: indexPath) as! RoundedButtonTableViewCell : tableView.dequeueReusableCell(withIdentifier: FileConstants.inputCellReuseIdentifier, for: indexPath) as! InputTableViewCell
        if let cell = cell as? InputTableViewCell {
            let inputItem = inputItems[indexPath.row]
            cell.configure(for: inputItem)
            return cell
        } else if let cell = cell as? RoundedButtonTableViewCell {
            cell.selectRoundedButtonDelegate = self
            cell.bringSubviewToFront(cell.loginButton)
            cell.bringSubviewToFront(cell.signUpButton)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == inputItems.count {
            return FileConstants.buttonCellHeight
        } else {
            return FileConstants.inputViewHeight
        }
    }

    func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func showKeyboard(notification: NSNotification) {
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        tableView.snp.remakeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview().offset(-keyboardFrame.height)
        }
    }

    @objc func hideKeyboard(notification: NSNotification) {
        tableView.snp.remakeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension LoginViewController: SelectRoundedButtonDelegate {
    func register() {
        guard let emailCell = tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? InputTableViewCell,
            let firstNameCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? InputTableViewCell,
            let lastNameCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? InputTableViewCell,
            let passwordCell = tableView.cellForRow(at: IndexPath(row: 4, section: 0)) as? InputTableViewCell,
            let phoneNumberCell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? InputTableViewCell,
            let email = emailCell.textField.text,
            let firstName = firstNameCell.textField.text,
            let lastName = lastNameCell.textField.text,
            let password = passwordCell.textField.text,
            let phoneNumber = phoneNumberCell.textField.text else { return }
        (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? InputTableViewCell)?.invalidEntryLabel.isHidden = firstName.isValidName()
        (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? InputTableViewCell)?.invalidEntryLabel.isHidden = lastName.isValidName()
        (tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? InputTableViewCell)?.invalidEntryLabel.isHidden = phoneNumber.isValidPhoneNumber()
        (tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? InputTableViewCell)?.invalidEntryLabel.isHidden = email.isValidEmail()
        (tableView.cellForRow(at: IndexPath(row: 4, section: 0)) as? InputTableViewCell)?.invalidEntryLabel.isHidden = password.isValidPassword()
        if email.isValidEmail() && firstName.isValidName() && lastName.isValidName() && password.isValidPassword() && phoneNumber.isValidPhoneNumber() {
            createUser(email: email, firstName: firstName, lastName: lastName, password: password, phoneNumber: phoneNumber)
        }
    }

    func login() {
        guard let email = (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? InputTableViewCell)?.textField.text, let password = (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? InputTableViewCell)?.textField.text else { return }
        (tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? InputTableViewCell)?.invalidEntryLabel.isHidden = email.isValidEmail()
        (tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? InputTableViewCell)?.invalidEntryLabel.isHidden = password != ""
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

    private func getUser(email: String, password: String) -> Future<User> {
        return networking(Endpoint.login(email: email, password: password)).decode()
    }

    private func createUser(email: String, firstName: String, lastName: String, password: String, phoneNumber: String) {
        networking(Endpoint.register(firstName: firstName, lastName: lastName, email: email, password: password, phoneNumber: phoneNumber))
    }

    func switchDataEntry(to type: EntryType) {
        switch type {
        case .login:
            inputItems = [
                InputItem(type: .email),
                InputItem(type: .password)
            ]
        case .signUp:
            inputItems = [
                InputItem(type: .firstName),
                InputItem(type: .lastName),
                InputItem(type: .phoneNumber),
                InputItem(type: .email),
                InputItem(type: .password)
            ]
        }
        tableView.reloadData()
    }

}
