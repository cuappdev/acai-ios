//
//  Constants.swift
//  acai-ios
//
//  Created by Drew Dunne on 3/28/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import AppDevSettings
import UIKit

enum Constants {

    /// The defined menu tabs for the home page
    static let menuTabs: [MenuItem.ItemType] = [.bowl, .smoothie, .drink]

    enum MenuTab {
        static let tabBarHeight: CGFloat = 51
    }

    static let settings = SettingsConfig(
        sections: [
            [
                .button("Order History", style: .detail, action: { vc in
                    // TODO: add order history view when finished
                    vc?.navigationController?.pushViewController(UIViewController(), animated: true)
                }),
                .button("Logout", style: .destructive, action: { vc in
                    // TODO: logout fucntion
                })
            ], [
                .button("AppDev Website", style: .link, action: { vc in
                    // TODO
                }),
                .button("Privacy Policy", style: .link, action: { vc in
                    // TODO
                }),
                .button("Feedback", style: .link, action: { vc in
                    // TODO
                })
            ]
        ],
        headerImage: UIImage(named: "acaiBowl"),
        headerHeight: 100
    )

}
