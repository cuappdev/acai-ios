////
////  TextView.swift
////  Chatty Cathy
////
////  Created by Artesia Ko on 2/18/19.
////  Copyright © 2019 Cornell AppDev. All rights reserved.
////
//
//import UIKit
//import SnapKit
//
//class DetailTextView: UIView {
//
//    // MARK: View vars
//    var textBox: UITextView!
//    var titleLabel: UILabel!
//    var priceLabel: UILabel!
//    var line: UIView!
//
//    var customizationOptions: [OrderCustomizationOption]!
//
//    // MARK: View initialization
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        titleLabel = UILabel()
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.font = Acai.avenirNextDemi.withSize(26)
//        titleLabel.textColor = .black
//        titleLabel.text = "Item Name"
//        self.addSubview(titleLabel)
//        titleLabel.snp.makeConstraints { (make) in
//            make.top.equalToSuperview()
//            make.leading.equalToSuperview()
//        }
//
//        priceLabel = UILabel()
//        priceLabel.translatesAutoresizingMaskIntoConstraints = false
//        priceLabel.font = Acai.avenirNextMedium.withSize(20)
//        priceLabel.textColor = .black
//        priceLabel.text = "$XX.XX"
//        priceLabel.textAlignment = .right
//        self.addSubview(priceLabel)
//        priceLabel.snp.makeConstraints { (make) in
//            make.firstBaseline.equalTo(titleLabel.snp.firstBaseline)
//            make.trailing.equalToSuperview()
//        }
//
//        textBox = UITextView()
//        textBox.translatesAutoresizingMaskIntoConstraints = false
//        textBox.isEditable = false
//        textBox.showsVerticalScrollIndicator = false
//        textBox.font = Acai.avenirNextMedium.withSize(16)
//        textBox.textColor = .acaiMedGray
//        textBox.text = ""
//        textBox.isScrollEnabled = false
//        self.addSubview(textBox)
//        textBox.snp.makeConstraints { (make) in
//            make.top.equalTo(titleLabel.snp.bottom).offset(12)
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-16)
//        }
//
//        line = UIView()
//        line.translatesAutoresizingMaskIntoConstraints = false
//        line.backgroundColor = .lineGray
//        self.addSubview(line)
//        line.snp.makeConstraints { (make) in
//            make.width.equalToSuperview()
//            make.height.equalTo(1)
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview()
//        }
//
//        customizationOptions = Acai.miamiBowl.customizationOptions
//        setDetailText()
//    }
//
//    func setDetailText() {
//        for option in customizationOptions {
//            for subOption in option.options {
//                if (subOption.isSelected) {
//                    if let text = textBox.text {
//                        if text == "" {
//                            textBox.text = "\(subOption.title)"
//                        }
//                        else {
//                            textBox.text = "\(text), \(subOption.title)"
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
