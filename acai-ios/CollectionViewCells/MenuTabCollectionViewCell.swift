//
//  MenuTabCollectionViewCell.swift
//  acai-ios
//
//  Created by Drew Dunne on 3/28/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit

extension UIImage {

    static func underlineImage(for text: String, andImage size: CGSize, font: UIFont) -> UIImage {

        let textWidth = text.width(withConstrainedHeight: size.height, font: font)
        let textHeight = text.height(withConstrainedWidth: textWidth, font: font)

        print(size.height, textWidth)

        let renderer = UIGraphicsImageRenderer(size: CGSize(width: textWidth, height: size.height))

        let img = renderer.image { ctx in
            // awesome drawing code
            let underlineOffset: CGFloat = 2.0
            let textYPos = (size.height - textHeight) / 2.0
            let underlineYPos = textYPos + textHeight + underlineOffset

            let rectangle = CGRect(x: 0, y: underlineYPos, width: textWidth, height: 1)
            ctx.cgContext.setFillColor(UIColor.mango.cgColor)

            ctx.cgContext.setStrokeColor(UIColor.mango.cgColor)
            ctx.cgContext.move(to: CGPoint(x: 0, y: underlineYPos))
            ctx.cgContext.addLine(to: CGPoint(x: textWidth, y: underlineYPos))
            ctx.cgContext.strokePath()
            ctx.cgContext.stroke(rectangle, width: 2)

            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.avenirNextMedium.withSize(14),
                .foregroundColor: UIColor.white,
                NSAttributedString.Key.strokeColor: UIColor.white
            ]

            text.draw(
                with: CGRect(x: 0, y: textYPos, width: textWidth, height: size.height),
                options: .usesLineFragmentOrigin,
                attributes: attrs,
                context: nil
            )
        }

        return img
    }

}

class MenuTabCollectionViewCell: UICollectionViewCell {

    // MARK: View vars
    var menuTabView: MenuTabView!

    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .acaiBlack

        let items = Constants.menuTabs.map { tab in tab.rawValue }

        menuTabView = MenuTabView(with: items)

        contentView.addSubview(menuTabView)

        setUpConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Constraint setup
    private func setUpConstraints() {

        let segmentedInsets: CGFloat = 16

        menuTabView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(segmentedInsets)
            make.top.bottom.equalToSuperview()
        }

    }

}
