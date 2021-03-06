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
        title: "Berry Loco",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Greek Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Mixed Berries", isSelected: true, price: 0.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00),
                OrderOption(title: "Granola", isSelected: true, price: 0.00),
                OrderOption(title: "Coconut Chips", isSelected: false, price: 1.00),
                OrderOption(title: "Almonds", isSelected: false, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00),
                OrderOption(title: "Chocolate Chips", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Strawberry", isSelected: false, price: 1.00),
                OrderOption(title: "Kiwi", isSelected: false, price: 1.00),
                OrderOption(title: "Flax Seed", isSelected: false, price: 1.00),
                OrderOption(title: "Apple", isSelected: false, price: 1.00),
                OrderOption(title: "Caramel", isSelected: false, price: 1.00),
                OrderOption(title: "Raisin", isSelected: false, price: 1.00),
                OrderOption(title: "Cinnamon", isSelected: false, price: 1.00),
                OrderOption(title: "Chocolate Sauce", isSelected: false, price: 1.00),
                OrderOption(title: "Nutella", isSelected: false, price: 1.00)
            ]
        ],
        image: UIImage(named: "acaiBowl")!,
        type: .bowl
    )

    static let testBowl2 = MenuItem(
        title: "Bad and Boujee",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Greek Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Granola", isSelected: true, price: 0.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00),
                OrderOption(title: "Peanut Butter", isSelected: true, price: 0.00),
                OrderOption(title: "Coconut Chips", isSelected: true, price: 0.00),
                OrderOption(title: "Chocolate Chips", isSelected: true, price: 0.00),
                OrderOption(title: "Almonds", isSelected: true, price: 0.00),
                OrderOption(title: "Mixed Berries", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Strawberry", isSelected: false, price: 1.00),
                OrderOption(title: "Kiwi", isSelected: false, price: 1.00),
                OrderOption(title: "Flax Seed", isSelected: false, price: 1.00),
                OrderOption(title: "Apple", isSelected: false, price: 1.00),
                OrderOption(title: "Caramel", isSelected: false, price: 1.00),
                OrderOption(title: "Raisin", isSelected: false, price: 1.00),
                OrderOption(title: "Cinnamon", isSelected: false, price: 1.00),
                OrderOption(title: "Chocolate Sauce", isSelected: false, price: 1.00),
                OrderOption(title: "Nutella", isSelected: false, price: 1.00)
            ]
        ],
        image: UIImage(named: "bad-and-boujee")!,
        type: .bowl
    )

    static let testBowl3 = MenuItem(
        title: "Miami",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Greek Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Mixed Berries", isSelected: false, price: 1.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00),
                OrderOption(title: "Granola", isSelected: true, price: 0.00),
                OrderOption(title: "Coconut Chips", isSelected: true, price: 0.00),
                OrderOption(title: "Almonds", isSelected: false, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00),
                OrderOption(title: "Chocolate Chips", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: true, price: 0.00),
                OrderOption(title: "Strawberry", isSelected: true, price: 0.00),
                OrderOption(title: "Kiwi", isSelected: false, price: 1.00),
                OrderOption(title: "Flax Seed", isSelected: false, price: 1.00),
                OrderOption(title: "Apple", isSelected: false, price: 1.00),
                OrderOption(title: "Caramel", isSelected: false, price: 1.00),
                OrderOption(title: "Raisin", isSelected: false, price: 1.00),
                OrderOption(title: "Cinnamon", isSelected: false, price: 1.00),
                OrderOption(title: "Chocolate Sauce", isSelected: false, price: 1.00),
                OrderOption(title: "Nutella", isSelected: false, price: 1.00)
            ]
        ],
        type: .bowl
    )

    static let testBowl4 = MenuItem(
        title: "Crunchy",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Greek Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Mixed Berries", isSelected: false, price: 1.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00),
                OrderOption(title: "Granola", isSelected: true, price: 0.00),
                OrderOption(title: "Coconut Chips", isSelected: true, price: 0.00),
                OrderOption(title: "Almonds", isSelected: true, price: 0.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00),
                OrderOption(title: "Chocolate Chips", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Strawberry", isSelected: false, price: 1.00),
                OrderOption(title: "Kiwi", isSelected: true, price: 0.00),
                OrderOption(title: "Flax Seed", isSelected: true, price: 0.00),
                OrderOption(title: "Apple", isSelected: false, price: 1.00),
                OrderOption(title: "Caramel", isSelected: false, price: 1.00),
                OrderOption(title: "Raisin", isSelected: false, price: 1.00),
                OrderOption(title: "Cinnamon", isSelected: false, price: 1.00),
                OrderOption(title: "Chocolate Sauce", isSelected: false, price: 1.00),
                OrderOption(title: "Nutella", isSelected: false, price: 1.00)
            ]
        ],
        image: UIImage(named: "crunchy")!,
        type: .bowl
    )

    static let testBowl5 = MenuItem(
        title: "Candy Apple",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Greek Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Mixed Berries", isSelected: false, price: 1.00),
                OrderOption(title: "Banana", isSelected: false, price: 1.00),
                OrderOption(title: "Granola", isSelected: true, price: 0.00),
                OrderOption(title: "Coconut Chips", isSelected: false, price: 1.00),
                OrderOption(title: "Almonds", isSelected: false, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00),
                OrderOption(title: "Chocolate Chips", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Strawberry", isSelected: false, price: 1.00),
                OrderOption(title: "Kiwi", isSelected: false, price: 1.00),
                OrderOption(title: "Flax Seed", isSelected: false, price: 1.00),
                OrderOption(title: "Apple", isSelected: true, price: 0.00),
                OrderOption(title: "Caramel", isSelected: true, price: 0.00),
                OrderOption(title: "Raisin", isSelected: true, price: 0.00),
                OrderOption(title: "Cinnamon", isSelected: true, price: 0.00),
                OrderOption(title: "Chocolate Sauce", isSelected: false, price: 1.00),
                OrderOption(title: "Nutella", isSelected: false, price: 1.00)
            ]
        ],
        type: .bowl
    )
    static let testBowl6 = MenuItem(
        title: "Par-Yay",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Greek Yogurt", isSelected: false, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Mixed Berries", isSelected: false, price: 1.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00),
                OrderOption(title: "Granola", isSelected: true, price: 0.00),
                OrderOption(title: "Coconut Chips", isSelected: true, price: 0.00),
                OrderOption(title: "Almonds", isSelected: false, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: true, price: 0.00),
                OrderOption(title: "Chocolate Chips", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Strawberry", isSelected: true, price: 0.00),
                OrderOption(title: "Kiwi", isSelected: false, price: 1.00),
                OrderOption(title: "Flax Seed", isSelected: false, price: 1.00),
                OrderOption(title: "Apple", isSelected: false, price: 1.00),
                OrderOption(title: "Caramel", isSelected: false, price: 1.00),
                OrderOption(title: "Raisin", isSelected: false, price: 1.00),
                OrderOption(title: "Cinnamon", isSelected: false, price: 1.00),
                OrderOption(title: "Chocolate Sauce", isSelected: true, price: 0.00),
                OrderOption(title: "Nutella", isSelected: false, price: 1.00)
            ]
        ],
        type: .bowl
    )
    static let testBowl7 = MenuItem(
        title: "Money Moves",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 10.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Oatmeal", isSelected: false, price: 7.99, image: UIImage(named: "acaiBowl")!),
                OrderOption(title: "Greek Yogurt", isSelected: false, price: 7.99, image: UIImage(named: "acaiBowl")!)
            ],
            .topping: [
                OrderOption(title: "Mixed Berries", isSelected: false, price: 1.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00),
                OrderOption(title: "Granola", isSelected: true, price: 0.00),
                OrderOption(title: "Coconut Chips", isSelected: true, price: 0.00),
                OrderOption(title: "Almonds", isSelected: false, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: false, price: 1.00),
                OrderOption(title: "Chocolate Chips", isSelected: false, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: false, price: 1.00),
                OrderOption(title: "Strawberry", isSelected: true, price: 0.00),
                OrderOption(title: "Kiwi", isSelected: true, price: 0.00),
                OrderOption(title: "Flax Seed", isSelected: false, price: 1.00),
                OrderOption(title: "Apple", isSelected: false, price: 1.00),
                OrderOption(title: "Caramel", isSelected: false, price: 1.00),
                OrderOption(title: "Raisin", isSelected: false, price: 1.00),
                OrderOption(title: "Cinnamon", isSelected: false, price: 1.00),
                OrderOption(title: "Chocolate Sauce", isSelected: false, price: 1.00),
                OrderOption(title: "Nutella", isSelected: true, price: 0.00)
            ]
        ],
        image: UIImage(named: "money-moves")!,
        type: .bowl
    )
    
    static let testSmoothie1 = MenuItem(
        title: "Sun's Out Guns Out",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Almond Milk", isSelected: true, price: 6.99, image: UIImage(named: "base: almond-milk")!)
            ],
            .topping: [
                OrderOption(title: "Chocolate Protein", isSelected: true, price: 0.00),
                OrderOption(title: "Peanut Butter", isSelected: true, price: 0.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00)
            ]
        ], image: UIImage(named: "suns-out-guns-out")!, type: .smoothie)
    static let testSmoothie2 = MenuItem(
        title: "Pina Colada",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Almond Milk", isSelected: true, price: 6.99, image: UIImage(named: "base: almond-milk")!)
            ],
            .topping: [
                OrderOption(title: "Pineapple", isSelected: true, price: 0.00),
                OrderOption(title: "Coconut Syrup", isSelected: true, price: 0.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00)
            ]
        ], type: .smoothie)
    static let testSmoothie3 = MenuItem(
        title: "Berry Good",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Almond Milk", isSelected: true, price: 6.99, image: UIImage(named: "base: almond-milk")!)
            ],
            .topping: [
                OrderOption(title: "Mixed Berries", isSelected: true, price: 0.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00),
                OrderOption(title: "Greek Yogurt", isSelected: true, price: 0.00)
            ]
        ], type: .smoothie)
    static let testSmoothie4 = MenuItem(
        title: "Chatty Cathy",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Almond Milk", isSelected: true, price: 6.99, image: UIImage(named: "base: almond-milk")!)
            ],
            .topping: [
                OrderOption(title: "Strawberry", isSelected: true, price: 0.00),
                OrderOption(title: "Pineapple", isSelected: true, price: 0.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00),
                OrderOption(title: "Spinach", isSelected: true, price: 0.00),
                OrderOption(title: "Greek Yogurt", isSelected: true, price: 0.00)
            ]
        ], image: UIImage(named: "chatty-cathy")!, type: .smoothie)
    static let testSmoothie5 = MenuItem(
        title: "Matcha Detox",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Almond Milk", isSelected: true, price: 7.99, image: UIImage(named: "base: almond-milk")!)
            ],
            .topping: [
                OrderOption(title: "Matcha Tea", isSelected: true, price: 0.00),
                OrderOption(title: "Spinach", isSelected: true, price: 0.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00),
                OrderOption(title: "Pineapple", isSelected: true, price: 0.00),
                OrderOption(title: "Greek Yogurt", isSelected: true, price: 0.00),
                OrderOption(title: "Coconut Syrup", isSelected: true, price: 0.00)
            ]
        ], image: UIImage(named: "matcha-detox")!, type: .smoothie)
    static let testSmoothie6 = MenuItem(
        title: "Acai Berry",
        price: 0.00,
        defaultOptions: [
            .base: [
                OrderOption(title: "Almond Milk", isSelected: true, price: 7.99, image: UIImage(named: "base: almond-milk")!)
            ],
            .topping: [
                OrderOption(title: "Acai", isSelected: true, price: 0.00),
                OrderOption(title: "Mixed Berries", isSelected: true, price: 0.00),
                OrderOption(title: "Banana", isSelected: true, price: 0.00),
                OrderOption(title: "Greek Yogurt", isSelected: true, price: 0.00)
            ]
        ], image: UIImage(named: "acai-berry")!, type: .smoothie)

    static let coffee1 = MenuItem(title: "Espresso", price: 0, defaultOptions: [
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 2.00, image: UIImage(named: "size: small")!),
            OrderOption(title: "Large", isSelected: false, price: 3.00, image: UIImage(named: "size: large")!)
        ]
        ], image: UIImage(named: "espresso")!, type: .drink)
    static let coffee2 = MenuItem(title: "Macchiato", price: 0, defaultOptions: [
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 2.50, image: UIImage(named: "size: small")!),
            OrderOption(title: "Large", isSelected: false, price: 3.50, image: UIImage(named: "size: large")!)
        ]
        ], image: UIImage(named: "macchiato")!, type: .drink)
    static let coffee3 = MenuItem(title: "Flat White", price: 0, defaultOptions: [
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 3.00, image: UIImage(named: "size: small")!),
            OrderOption(title: "Large", isSelected: false, price: 4.00, image: UIImage(named: "size: large")!)
        ]
        ], image: UIImage(named: "flat-white")!, type: .drink)
    static let coffee4 = MenuItem(title: "Con Panna", price: 0, defaultOptions: [
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 2.50, image: UIImage(named: "size: small")!),
            OrderOption(title: "Large", isSelected: false, price: 3.50, image: UIImage(named: "size: large")!)
        ]
        ], image: UIImage(named: "con-panna")!, type: .drink)
    static let coffee5 = MenuItem(title: "Americano", price: 0, defaultOptions: [
        .base: [
            OrderOption(title: "Regular", isSelected: true, price: 0.00, image: UIImage()),
            OrderOption(title: "Iced", isSelected: false, price: 0.00, image: UIImage())
        ],
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 3.00, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 3.75, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 4.25, image: UIImage(named: "size: large")!)
        ]
        ], type: .drink)
    static let coffee6 = MenuItem(title: "Latte", price: 0, defaultOptions: [
        .base: [
            OrderOption(title: "Regular", isSelected: true, price: 0.00, image: UIImage()),
            OrderOption(title: "Iced", isSelected: false, price: 0.00, image: UIImage())
        ],
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 3.50, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 4.00, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 4.50, image: UIImage(named: "size: large")!)
        ]
        ], image: UIImage(named: "latte")!, type: .drink)
    static let coffee7 = MenuItem(title: "Cappuccino", price: 0, defaultOptions: [
        .base: [
            OrderOption(title: "Regular", isSelected: true, price: 0.00, image: UIImage()),
            OrderOption(title: "Iced", isSelected: false, price: 0.00, image: UIImage())
        ],
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 3.50, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 4.00, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 4.50, image: UIImage(named: "size: large")!)
        ]
        ], image: UIImage(named: "cappucino")!, type: .drink)
    static let coffee8 = MenuItem(title: "Mocha Latte", price: 0, defaultOptions: [
        .base: [
            OrderOption(title: "Regular", isSelected: true, price: 0.00, image: UIImage()),
            OrderOption(title: "Iced", isSelected: false, price: 0.00, image: UIImage())
        ],
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 4.00, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 4.50, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 5.00, image: UIImage(named: "size: large")!)
        ]
        ], image: UIImage(named: "mocha-latte")!, type: .drink)
    static let coffee9 = MenuItem(title: "Caramel Mochaccino", price: 0, defaultOptions: [
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 4.00, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 4.50, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 5.00, image: UIImage(named: "size: large")!)
        ]
        ], type: .drink)
    static let coffee10 = MenuItem(title: "Hot Chocolate", price: 0, defaultOptions: [
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 3.50, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 4.00, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 4.50, image: UIImage(named: "size: large")!)
        ]
        ], image: UIImage(named: "hot-chocolate")!, type: .drink)
    static let coffee11 = MenuItem(title: "Cold Brew", price: 0, defaultOptions: [
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 3.00, image: UIImage(named: "size: small")!),
            OrderOption(title: "Large", isSelected: false, price: 3.75, image: UIImage(named: "size: large")!)
        ]
        ], type: .drink)
    static let coffee12 = MenuItem(title: "Chai Tea Latte", price: 0, defaultOptions: [
        .base: [
            OrderOption(title: "Regular", isSelected: true, price: 0.00, image: UIImage()),
            OrderOption(title: "Iced", isSelected: false, price: 0.00, image: UIImage())
        ],
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 4.00, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 4.50, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 5.00, image: UIImage(named: "size: large")!)
        ]
        ], type: .drink)
    static let coffee13 = MenuItem(title: "Matcha Tea", price: 0, defaultOptions: [
        .base: [
            OrderOption(title: "Regular", isSelected: true, price: 0.00, image: UIImage()),
            OrderOption(title: "Iced", isSelected: false, price: 0.00, image: UIImage())
        ],
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 3.00, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 3.50, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 4.00, image: UIImage(named: "size: large")!)
        ]
        ], image: UIImage(named: "matcha")!, type: .drink)
    static let coffee14 = MenuItem(title: "Chai Matcha Tea Latte", price: 0, defaultOptions: [
        .base: [
            OrderOption(title: "Regular", isSelected: true, price: 0.00, image: UIImage()),
            OrderOption(title: "Iced", isSelected: false, price: 0.00, image: UIImage())
        ],
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 4.25, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 4.50, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 5.00, image: UIImage(named: "size: large")!)
        ]
        ], type: .drink)
    static let coffee15 = MenuItem(title: "Matcha Tea Latte", price: 0, defaultOptions: [
        .base: [
            OrderOption(title: "Regular", isSelected: true, price: 0.00, image: UIImage()),
            OrderOption(title: "Iced", isSelected: false, price: 0.00, image: UIImage())
        ],
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 3.50, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 4.00, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 4.50, image: UIImage(named: "size: large")!)
        ]
        ], type: .drink)
    static let coffee16 = MenuItem(title: "Harney & Sons Tea", price: 0, defaultOptions: [
        .base: [
            OrderOption(title: "Green", isSelected: true, price: 3.00, image: UIImage(named: "tea")!),
            OrderOption(title: "English Breakfast", isSelected: false, price: 3.00, image: UIImage(named: "tea")!),
            OrderOption(title: "Decaf Earl Grey", isSelected: false, price: 3.00, image: UIImage(named: "tea")!),
            OrderOption(title: "Peppermint", isSelected: false, price: 3.00, image: UIImage(named: "tea")!),
            OrderOption(title: "Chamomile", isSelected: false, price: 3.00, image: UIImage(named: "tea")!)
        ]
        ], image: UIImage(named: "tea")!, type: .drink)
    static let coffee17 = MenuItem(title: "Iced Coffee", price: 0, defaultOptions: [
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 3.50, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 4.00, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 4.50, image: UIImage(named: "size: large")!)
        ]
        ], image: UIImage(named: "iced-coffee")!, type: .drink)
    
    static let drink1 = MenuItem(title: "Black Tea", price: 0, defaultOptions: [
        .size: [
            OrderOption(title: "Small", isSelected: true, price: 3.00, image: UIImage(named: "size: small")!),
            OrderOption(title: "Medium", isSelected: false, price: 3.25, image: UIImage(named: "size: medium")!),
            OrderOption(title: "Large", isSelected: false, price: 3.50, image: UIImage(named: "size: large")!)
        ]
        ], image: UIImage(named: "black-tea")!, type: .drink)
    
    static let testCart1 = CartItem(menuItem: Acai.testBowl1, quantity: 1, selectedOptions: [
            .base: [
                OrderOption(title: "Acai", isSelected: true, price: 9.99, image: UIImage(named: "acaiBowl")!)            ],
            .topping: [
                OrderOption(title: "Strawberry", isSelected: true, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: true, price: 1.00),
                OrderOption(title: "Granola", isSelected: true, price: 1.00)
            ]
        ])
    static let testCart2 = CartItem(menuItem: Acai.testBowl2, quantity: 2, selectedOptions: [
            .base: [
                OrderOption(title: "Yogurt", isSelected: true, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .size: [
                OrderOption(title: "Large", isSelected: true, price: 2.00, image: UIImage(named: "size: large")!)
            ],
            .topping: [
                OrderOption(title: "Strawberry", isSelected: true, price: 1.00),
                OrderOption(title: "Pineapple", isSelected: true, price: 1.00),
                OrderOption(title: "Granola", isSelected: true, price: 1.00),
                OrderOption(title: "Coconut", isSelected: true, price: 1.00),
                OrderOption(title: "Almonds", isSelected: true, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: true, price: 1.00)
            ]
        ])
    static let testCart3 = CartItem(menuItem: Acai.testBowl4, quantity: 3, selectedOptions: [
            .base: [
                OrderOption(title: "Oatmeal", isSelected: true, price: 6.99, image: UIImage(named: "acaiBowl")!)
            ],
            .size: [
                OrderOption(title: "Small", isSelected: true, price: 0, image: UIImage(named: "size: small")!)
            ],
            .topping: [
                OrderOption(title: "Coconut", isSelected: true, price: 1.00),
                OrderOption(title: "Almonds", isSelected: true, price: 1.00),
                OrderOption(title: "Peanut Butter", isSelected: true, price: 1.00)
            ]
        ])

}
