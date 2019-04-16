//
//  ButtonTableViewCell.swift
//  AppDevSettings
//
//  Created by Drew Dunne on 4/13/19.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    public var style: SettingsConfig.Item.ButtonStyle! {
        didSet {
            textLabel?.textColor = style.color()
            textLabel?.textAlignment = style == .detail ? .left : .center

            accessoryType = style == .detail ? .disclosureIndicator : .none
        }
    }

    public var title: String! {
        didSet {
            textLabel?.text =  title
        }
    }

}
