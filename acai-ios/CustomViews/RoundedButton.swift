//
//  RoundedButton.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/10/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    
    var type: ActionType?
    
    enum ActionType {
        case action
        case switchDataEntry
    }
    
    private enum FileConstants {
        static let cornerRadius: CGFloat = 4
    }

    init(frame: CGRect, title: String, type: ActionType) {
        super.init(frame: frame)
        self.type = type
        
        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.avenirNextRegular.withSize(14)
        layer.cornerRadius = FileConstants.cornerRadius
        updateColor()
    }
    
    func toggleColor() {
        type = type == .action ? .switchDataEntry : .action
        updateColor()
    }
    
    func updateColor() {
        backgroundColor = type == .action ? .acaiBlack : .sleetGray
        setTitleColor(type == .action ? .white : .placeholderGray, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
