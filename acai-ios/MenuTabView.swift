//
//  MenuTabView.swift
//  acai-ios
//
//  Created by Drew Dunne on 3/28/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//
//  Adapted from Jack Thompson's EpisodeFilterView from Ceres

import UIKit
import SnapKit

class MenuTabView: UIControl {

    // MARK: - Subview Variables
    private var stackView: UIStackView!
    var underline: UIView!
    private var buttons: [UIButton] = []
    private var items: [String]!

    // MARK: - Control Data
    var selectedSegmentIndex: Int = 0 {
        didSet {
            remakeUnderlineConstraints()
        }
    }

    // MARK: - Properties
    var underlineHeight: CGFloat = 2.5 {
        didSet {
            remakeUnderlineConstraints()
        }
    }

    var underlineOffset: CGFloat = 3.0 {
        didSet {
            remakeUnderlineConstraints()
        }
    }

    var titleAttributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.avenirNextMedium.withSize(14),
        .foregroundColor: UIColor.white
        ] {
        didSet {
            setButtonTitleAttributes()
        }
    }

    var contentInset: CGFloat = 32.0 {
        didSet {
            remakeContentInset()
        }
    }

    init(with items: [String]) {
        super.init(frame: .zero)

        backgroundColor = .clear

        stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing

        buttons = []
        self.items = items

        items.enumerated().forEach { arg in
            let (i, _) = arg
            let button = UIButton()
            button.tag = i
            button.addTarget(self, action: #selector(didSelect), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            buttons.append(button)
        }

        setButtonTitleAttributes()

        underline = UIView()
        underline.backgroundColor = .mango

        addSubview(stackView)
        addSubview(underline)

        setUpConstraints()
    }

    private func setUpConstraints() {

        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(contentInset)
        }

        underline.snp.makeConstraints { make in
            make.height.equalTo(underlineHeight)
            make.leading.trailing.equalTo(stackView.subviews[selectedSegmentIndex])
            make.centerY.equalTo(stackView).offset(getTrueUnderlineOffset())
        }

    }

    private func remakeContentInset() {
        guard underline != nil && stackView != nil else { return }

        stackView.snp.remakeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(contentInset)
        }

        layoutSubviews()

        remakeUnderlineConstraints()
    }

    private func getTrueUnderlineOffset() -> CGFloat {
        let font: UIFont = titleAttributes[.font] as? UIFont ?? UIFont.systemFont(ofSize: 12)
        let textHeight = "Test".height(withConstrainedWidth: UIScreen.main.bounds.width, font: font)
        return textHeight / 2 + underlineOffset
    }

    private func remakeUnderlineConstraints() {
        guard underline != nil && stackView != nil else { return }

        underline.snp.remakeConstraints { make in
            make.height.equalTo(underlineHeight)
            make.leading.trailing.equalTo(stackView.subviews[selectedSegmentIndex])
            make.centerY.equalTo(stackView).offset(getTrueUnderlineOffset())
        }
    }

    private func setButtonTitleAttributes() {
        buttons.enumerated().forEach { arg in
            let (i, button) = arg
            let attrStr = NSAttributedString(string: items[i], attributes: titleAttributes)
            button.setAttributedTitle(attrStr, for: .normal)
        }
    }

    @objc func didSelect(sender: UIButton) {
        selectedSegmentIndex = sender.tag
        sendActions(for: .valueChanged)
        UIView.animate(withDuration: 0.25) {
            self.remakeUnderlineConstraints()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
