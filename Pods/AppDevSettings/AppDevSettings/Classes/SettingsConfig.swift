//
//  SettingsConfig.swift
//  AppDevSettings
//
//  Created by Drew Dunne on 4/11/19.
//

import Foundation

public struct SettingsConfig {

    public enum Item {
        case bool(_ title: String, key: String, completion: ((Bool) -> Void)?)
        case int(_ title: String, key: String, completion: ((Int) -> Void)?)
        case string(_ title: String, key: String, completion: ((String?) -> Void)?)
        case button(_ title: String, style: ButtonStyle, action: ((SettingsViewController?) -> Void)?)

        public enum ButtonStyle {
            case destructive // red
            case link
            case detail

            internal func color() -> UIColor {
                switch self {
                case .destructive:
                    return .red
                case .link:
                    return .blue
                case .detail:
                    return .darkText
                }
            }
        }
    }

    public let headerImage: UIImage?

    public let headerHeight: CGFloat?

    public let headerView: UIView?

    public let sectionsOfItems: [[Item]]

    public init(sections: [[Item]] = [], headerImage: UIImage? = nil, headerHeight: CGFloat? = nil) {
        self.sectionsOfItems = sections
        self.headerImage = headerImage
        self.headerView = nil
        self.headerHeight = headerHeight
    }

    public init(sections: [[Item]] = [], headerView: UIView? = nil, headerHeight: CGFloat? = nil) {
        self.sectionsOfItems = sections
        self.headerImage = nil
        self.headerView = headerView
        self.headerHeight = headerHeight
    }

}
