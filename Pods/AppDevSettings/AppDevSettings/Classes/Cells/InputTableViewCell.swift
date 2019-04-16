//
//  InputTableViewCell.swift
//  AppDevSettings
//
//  Created by Drew Dunne on 4/13/19.
//

import SnapKit
import UIKit

class InputTableViewCell: UITableViewCell {

    var textField: UITextField!

    public var completion: ((String?) -> Void)?

    public var key: String! {
        didSet {
            textField.text = UserDefaults.standard.string(forKey: key)
        }
    }

    public var title: String! {
        didSet {
            textLabel?.text =  title
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        textLabel?.backgroundColor = .red

        textField = UITextField()
        textField.delegate = self
        textField.backgroundColor = .red
        contentView.addSubview(textField)

        textField.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.equalTo(textLabel!.snp.trailing)
        }

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension InputTableViewCell: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        UserDefaults.standard.set(textField.text, forKey: key)
        UserDefaults.standard.synchronize()

        completion?(textField.text)
    }

}
