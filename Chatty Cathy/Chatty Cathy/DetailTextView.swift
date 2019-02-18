//
//  TextView.swift
//  Chatty Cathy
//
//  Created by Artesia Ko on 2/18/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class DetailTextView: UIView {
    
    // MARK: View vars
    var textBox: UITextView!

    // MARK: View initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textBox = UITextView()
        textBox.translatesAutoresizingMaskIntoConstraints = false
        textBox.isEditable = false
        textBox.showsVerticalScrollIndicator = false
        textBox.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        textBox.textColor = .black
        textBox.text = "DetailTextView TextBox"
        self.addSubview(textBox)
        textBox.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
