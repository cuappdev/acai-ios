//
//  ArrowLabelActionTabView.swift
//  acai-ios
//
//  Created by Jaewon Sim on 4/10/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

class ArrowLabelActionTabView: UIView {

    // MARK: View vars
    var label: UILabel!
    var arrow: UIImageView!

    init(text: String) {
        super.init(frame: .zero)
        backgroundColor = .acaiBlack

        label = UILabel()
        label.textColor = .white
        label.font = UIFont.avenirNextDemi.withSize(17)
        label.text = text
        self.addSubview(label)

        arrow = UIImageView()
        arrow.image = UIImage(named: "forwardArrow")
        arrow.contentMode = .scaleAspectFit
        self.addSubview(arrow)

        setupConstraints()
    }

    private func setupConstraints() {
        let arrowHeight = 15
        let arrowWidth = 8.7
        let leadingTrailingOffset = 24

        arrow.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(arrowHeight)
            make.width.equalTo(arrowWidth)
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
        }

        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingTrailingOffset)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(arrow.snp.leading).offset(leadingTrailingOffset)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}