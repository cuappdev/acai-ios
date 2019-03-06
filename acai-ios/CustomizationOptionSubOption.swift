//
//  CustomizationOptionSubOptions.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import Foundation

class CustomizationOptionSubOption {
    var title: String = ""
    var isSelected: Bool = false
    
    init (title: String, isSelected: Bool) {
        self.title = title
        self.isSelected = isSelected
    }
    
}
