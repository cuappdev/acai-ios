//
//  CartCollectionViewCell.swift
//  acai-ios
//
//  Created by Jaewon Sim on 4/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import IGListKit
import SnapKit
import UIKit

protocol CartCollectionViewCellDelegate: class {
    func valueIncremented()
    func valueDecremented()
}

class CartCollectionViewCell: UICollectionViewCell {

    // MARK: View vars
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var ingredientsCollectionView: UICollectionView!
    private var decrementButton: UIButton!
    private var currentCountLabel: UILabel!
    private var incrementButton: UIButton!
    private var totalPriceLabel: UILabel!
    private var line: UIView!

    // MARK: Delegate
    weak var delegate: CartCollectionViewCellDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)

        titleLabel = UILabel()
        titleLabel.textColor = .acaiBlack
        titleLabel.font = UIFont.avenirNextBold.withSize(17)
        contentView.addSubview(titleLabel)

        let layout = UICollectionViewFlowLayout()
        ingredientsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        ingredientsCollectionView.backgroundColor = .clear
        ingredientsCollectionView.isScrollEnabled = false
        contentView.addSubview(ingredientsCollectionView)

        decrementButton = UIButton()
        decrementButton.tintColor = .acaiBlackTwo
        // TODO: change to image
        decrementButton.setTitle("-", for: .normal)
        decrementButton.setTitleColor(.black, for: .normal)
        decrementButton.addTarget(self, action: #selector(decrement), for: .touchUpInside)
        contentView.addSubview(decrementButton)

        currentCountLabel = UILabel()
        currentCountLabel.textColor = .acaiBlack
        currentCountLabel.font = UIFont.avenirNextBold.withSize(14)
        contentView.addSubview(currentCountLabel)

        incrementButton = UIButton()
        incrementButton.tintColor = .acaiBlack
        // TODO: change to image
        incrementButton.setTitle("+", for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.addTarget(self, action: #selector(increment), for: .touchUpInside)
        contentView.addSubview(incrementButton)

        totalPriceLabel = UILabel()
        totalPriceLabel.textColor = .acaiBlack
        totalPriceLabel.font = UIFont.avenirNextBold.withSize(14)
        totalPriceLabel.textAlignment = .right
        contentView.addSubview(totalPriceLabel)

        line = UIView()
        line.backgroundColor = .lineGray
        contentView.addSubview(line)

        setUpConstraints()
    }

    @objc func decrement() {
        // TODO: put delegate in superview
        print("decrement pressed")
        self.delegate?.valueDecremented()
    }

    @objc func increment() {
        // TODO: put delegate in superview
        print("increment pressed")
        self.delegate?.valueIncremented()
    }

    // MARK: Constraint setup
    private func setUpConstraints() {
        let buttonHeightWidth = 24
        let buttonLabelHorizontalOffset = 10
        let imageViewHeightWidth = 55
        let leadingTrailingOffset = 24
        let lineHeight = 1
        let topOffset = 24
        let verticalOffset = 8
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(leadingTrailingOffset)
            make.height.width.equalTo(imageViewHeightWidth)
            make.top.equalToSuperview().offset(topOffset)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(leadingTrailingOffset)
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
            make.top.equalTo(imageView.snp.top)
        }
        ingredientsCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(leadingTrailingOffset)
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
            make.top.equalTo(titleLabel.snp.bottom).offset(verticalOffset)
        }
        decrementButton.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.height.width.equalTo(buttonHeightWidth)
            make.top.equalTo(ingredientsCollectionView.snp.bottom).offset(verticalOffset)
        }
        currentCountLabel.snp.makeConstraints { make in
            make.leading.equalTo(decrementButton.snp.trailing).offset(buttonLabelHorizontalOffset)
            make.centerY.equalTo(decrementButton.snp.centerY)
        }
        incrementButton.snp.makeConstraints { make in
            make.leading.equalTo(currentCountLabel.snp.trailing).offset(buttonLabelHorizontalOffset)
            make.centerY.equalTo(decrementButton.snp.centerY)
            make.height.width.equalTo(buttonHeightWidth)
        }
        totalPriceLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-leadingTrailingOffset)
            make.centerY.equalTo(currentCountLabel)
        }
        line.snp.makeConstraints { make in
            make.height.equalTo(lineHeight)
            make.bottom.leading.trailing.equalToSuperview()
        }

    }

    func configure(for cartItem: CartItem) {
        print(cartItem)
        guard let menuItem = cartItem.menuItem else { return }
        imageView.image = menuItem.image
        titleLabel.text = menuItem.title
        ingredientsCollectionView.tag = cartItem.tag

        if let quantity = cartItem.quantity {
            currentCountLabel.text = String(quantity)
            if quantity == 1 {
                decrementButton.tintColor = .lineGray
                decrementButton.setTitleColor(.lineGray, for: .normal)
            } else {
                decrementButton.tintColor = .acaiBlack
                decrementButton.setTitleColor(.acaiBlack, for: .normal)
            }
        }

        totalPriceLabel.text = cartItem.getPrice().asPriceString()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
