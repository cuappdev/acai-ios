//
//  CenteredLabelActionTabView.swift
//  acai-ios
//
//  Created by Artesia Ko on 4/22/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import SnapKit
import UIKit

class CenteredLabelActionTabView: UIView {

    // MARK: View vars
    var label: UILabel!

    init(text: String) {
        super.init(frame: .zero)
        backgroundColor = .acaiBlack

        label = UILabel()
        label.textColor = .white
        label.font = UIFont.avenirNextMedium.withSize(17)
        label.text = text
        self.addSubview(label)

        setupConstraints()
    }

    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
