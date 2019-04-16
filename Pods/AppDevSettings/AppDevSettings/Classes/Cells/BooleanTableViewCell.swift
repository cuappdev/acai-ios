//
//  BooleanTableViewCell.swift
//  AppDevSettings
//
//  Created by Drew Dunne on 4/12/19.
//

import UIKit

class BooleanTableViewCell: UITableViewCell {

    private var booleanSwitch: UISwitch!

    public var completion: ((Bool) -> Void)?

    public var key: String! {
        didSet {
            booleanSwitch.isOn = UserDefaults.standard.bool(forKey: key)
        }
    }

    public var title: String! {
        didSet {
            textLabel?.text =  title
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        booleanSwitch = UISwitch()
        booleanSwitch.addTarget(self, action: #selector(boolChanged(sender:)), for: .valueChanged)
        accessoryView = booleanSwitch

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func boolChanged(sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: key)
        UserDefaults.standard.synchronize()

        completion?(sender.isOn)
    }

}
