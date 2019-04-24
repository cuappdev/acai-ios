//
//  PaymentViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

protocol PaymentViewControllerDelegate: class {
    func popSuperviewController()
}

class PaymentViewController: UIViewController {

    weak var delegate: PaymentViewControllerDelegate?

    // MARK: View vars
    private var completeTransactionActionTabView: CenteredLabelActionTabView!
    private var tableView: UITableView!
    private var bottomFillerRect: UIView!

    // MARK: Constants
    private enum FileConstants {

        // MARK: Reuse identifiers
        static let inputCellReuseIdentifier = "inputCellReuseIdentifier"
        static let labelCellReuseIdentifier = "labelCellReuseIdentifier"

        // MARK: Constraint constants
        static let inputViewBottomOffset: CGFloat = 10
        static let inputViewHeight: CGFloat = 75
        static let inputViewTopOffset: CGFloat = 49
    }

    // MARK: Data
    // TODO: update last two items to conform to design
    var inputItems: [UserInputItem] = [
        UserInputItem(type: .cardNumber),
        UserInputItem(type: .cardHolder),
        UserInputItem(type: .expirationDate),
        UserInputItem(type: .cvc)
    ]
    var cardNumber: String = ""
    var cardHolder: String = ""
    var expirationDate: String = ""
    var cvc: String = ""

    var attemptedTransaction: Bool = false

    // MARK: Gesture recognizers
    private var completeTransactionGestureRecognizer: UIGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

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
        tableView.register(TextTableViewCell.self, forCellReuseIdentifier: FileConstants.labelCellReuseIdentifier)
        view.addSubview(tableView)

        completeTransactionActionTabView = CenteredLabelActionTabView(text: "Complete Transaction")
        view.addSubview(completeTransactionActionTabView)

        completeTransactionGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(completeTransaction))
        completeTransactionActionTabView.addGestureRecognizer(completeTransactionGestureRecognizer)

        bottomFillerRect = UIView()
        bottomFillerRect.backgroundColor = .acaiBlack
        view.addSubview(bottomFillerRect)

        setupConstraints()
    }

    @objc private func completeTransaction() {
        let orderConfirmationViewController = OrderConfirmationViewController()
        orderConfirmationViewController.delegate = self
        navigationController?.pushViewController(orderConfirmationViewController, animated: true)
    }

    private func setupConstraints() {
        let completeTransactionActionTabViewHeight = 58
        bottomFillerRect.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        completeTransactionActionTabView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(completeTransactionActionTabViewHeight)
        }
        tableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(completeTransactionActionTabView.snp.top)
        }
    }

    private func formatNavigationBar() {
        let navigationTitleLabel = UILabel()
        navigationTitleLabel.text = "Payment"
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

    func resetTextFields() {
        cardNumber = ""
        cardHolder = ""
        expirationDate = ""
        cvc = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension PaymentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // +1 for label text
        return inputItems.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FileConstants.labelCellReuseIdentifier, for: indexPath) as! TextTableViewCell
            cell.configure(for: "Your information will always remain private and never shared.")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FileConstants.inputCellReuseIdentifier, for: indexPath) as! InputTableViewCell
            let inputItem = inputItems[indexPath.row - 1]
            cell.changeInputTextFieldDelegate = self
            cell.invalidEntryLabel.isHidden = true
            if let type = inputItem.type {
                if type == .cardNumber {
                    cell.textField.text = cardNumber
                    if attemptedTransaction {
                        cell.invalidEntryLabel.isHidden = cardNumber.isValidCardNumber()
                    }
                } else if type == .cardHolder {
                    cell.textField.text = cardHolder
                    if attemptedTransaction {
                        cell.invalidEntryLabel.isHidden = cardHolder.isValidCardHolder()
                    }
                } else if type == .expirationDate {
                    cell.textField.text = expirationDate
                    if attemptedTransaction {
                        cell.invalidEntryLabel.isHidden = expirationDate.isValidExpirationDate()
                    }
                } else if type == .cvc {
                    cell.textField.text = cvc
                    if attemptedTransaction {
                        cell.invalidEntryLabel.isHidden = cvc.isValidCVC()
                    }
                }
            }
            cell.configure(for: inputItem)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return FileConstants.inputViewHeight
    }
}

extension PaymentViewController: ChangeInputTextFieldDelegate {
    func changeText(text: String, type: InputType) {
        if type == .cardNumber {
            cardNumber = text
        } else if type == .cardHolder {
            cardHolder = text
        } else if type == .expirationDate {
            expirationDate = text
        } else if type == .cvc {
            cvc = text
        }
    }
}

extension PaymentViewController: OrderConfirmationViewControllerDelegate {
    func popSuperviewController() {
        print("popping payment")
        navigationController?.popViewController(animated: false)
        self.delegate?.popSuperviewController()
    }
}
