//
//  CenteredButtonCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

class CenteredButtonCollectionViewCell: UICollectionViewCell {
    // MARK: View vars
    private var button: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)

        button = UIButton()
        button.setTitleColor(.acaiBlack, for: .normal)
        button.layer.cornerRadius = 4
        button.backgroundColor = .clear
        button.layer.borderColor = UIColor.acaiBlack.cgColor
        button.layer.borderWidth = 1
        contentView.addSubview(button)

        setupConstraints()
    }

    private func setupConstraints() {
        let buttonHeight = 43
        let buttonWidth = 151
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(buttonHeight)
            make.width.equalTo(buttonWidth)
        }
    }

    func configure(for title: String) {
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.avenirNextDemi.withSize(14)
        if title == "Add another item" {
            button.addTarget(self, action: #selector(addAnotherItem), for: .touchUpInside)
        }
    }

    @objc func addAnotherItem() {
        print("add another item pressed")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
