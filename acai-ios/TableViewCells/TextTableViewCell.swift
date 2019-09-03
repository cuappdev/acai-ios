//
//  TextTableViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    // MARK: label
    var label: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // TODO: fix bug -- if set backgroundColor to clear and switch between signup and login, then label keeps generating on top of itself (text gets thicker)
        backgroundColor = .white

        label = UILabel()
        label.textColor = .acaiBlack
        label.font = UIFont.avenirNextMedium.withSize(17)
        label.numberOfLines = 0
        contentView.addSubview(label)

        setupConstraints()
    }

    private func setupConstraints() {
        let leadingTrailingOffset = 35

        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingTrailingOffset)
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
            make.top.centerX.equalToSuperview()
        }
    }

    func configure(for text: String) {
        label.text = text
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
