//
//  Acai.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation
import UIKit

class Acai {

    // hard code for testing
    static let testBowl1 = MenuItem(
        title: "Miami",
        price: 8.99,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: false, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Yogurt", isSelected: true, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Strawberry", isSelected: true, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Granola", isSelected: false, price: 1.00),
                OrderOption(title: "Coconut", isSelected: true, price: 1.00),
                OrderOption(title: "Almonds", isSelected: false, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00)
            ]
        ],
        image: UIImage(named: "acaiBowl")!,
        type: .bowl
    )

    static let testBowl2 = MenuItem(
        title: "Crunchy",
        price: 7.99,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .size: [
                OrderOption(title: "Small", isSelected: true, price: 0, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Large", isSelected: false, price: 2.00, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Strawberry", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Granola", isSelected: true, price: 1.00),
                OrderOption(title: "Coconut", isSelected: true, price: 1.00),
                OrderOption(title: "Almonds", isSelected: true, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00)
            ]
        ],
        image: UIImage(named: "acaiBowl")!,
        type: .bowl
    )

    static let testBowl3 = MenuItem(
        title: "Surprise",
        price: 7.99,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .size: [
                OrderOption(title: "Small", isSelected: true, price: 0, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Large", isSelected: false, price: 2.00, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Strawberry", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Granola", isSelected: true, price: 1.00),
                OrderOption(title: "Coconut", isSelected: true, price: 1.00),
                OrderOption(title: "Almonds", isSelected: true, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00)
            ]
        ],
        image: UIImage(named: "acaiBowl")!,
        type: .bowl
    )

    static let testBowl4 = MenuItem(
        title: "Berry Loco",
        price: 7.99,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .size: [
                OrderOption(title: "Small", isSelected: true, price: 0, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Large", isSelected: false, price: 2.00, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Strawberry", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Granola", isSelected: true, price: 1.00),
                OrderOption(title: "Coconut", isSelected: true, price: 1.00),
                OrderOption(title: "Almonds", isSelected: true, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00)
            ]
        ],
        image: UIImage(named: "acaiBowl")!,
        type: .bowl
    )

    static let testBowl5 = MenuItem(
        title: "Party",
        price: 7.99,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .size: [
                OrderOption(title: "Small", isSelected: true, price: 0, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Large", isSelected: false, price: 2.00, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Strawberry", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Granola", isSelected: true, price: 1.00),
                OrderOption(title: "Coconut", isSelected: true, price: 1.00),
                OrderOption(title: "Almonds", isSelected: true, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00)
            ]
        ],
        image: UIImage(named: "acaiBowl")!,
        type: .bowl
    )

    static let testCart1 = CartItem(menuItem: Acai.testBowl1, quantity: 1, selectedOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: false, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Yogurt", isSelected: true, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Strawberry", isSelected: true, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Granola", isSelected: false, price: 1.00),
                OrderOption(title: "Coconut", isSelected: true, price: 1.00),
                OrderOption(title: "Almonds", isSelected: false, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00)
            ]
        ])
    static let testCart2 = CartItem(menuItem: Acai.testBowl2, quantity: 2, selectedOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .size: [
                OrderOption(title: "Small", isSelected: true, price: 0, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Large", isSelected: false, price: 2.00, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Strawberry", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Granola", isSelected: true, price: 1.00),
                OrderOption(title: "Coconut", isSelected: true, price: 1.00),
                OrderOption(title: "Almonds", isSelected: true, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00)
            ]
        ])
    static let testCart3 = CartItem(menuItem: Acai.testBowl4, quantity: 3, selectedOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .size: [
                OrderOption(title: "Small", isSelected: true, price: 0, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Large", isSelected: false, price: 2.00, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Strawberry", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Granola", isSelected: true, price: 1.00),
                OrderOption(title: "Coconut", isSelected: true, price: 1.00),
                OrderOption(title: "Almonds", isSelected: true, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00)
            ]
        ])

}
