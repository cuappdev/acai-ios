//
//  CartCollectionViewCell.swift
//  acai-ios
//
//  Created by Jaewon Sim on 4/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

protocol CartCollectionViewCellDelegate: class {
    func didPressIncrement()
    func didPressDecrement()
}

class CartCollectionViewCell: UICollectionViewCell {
    
    // MARK: View vars
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var ingredientsCollectionView: UICollectionView!
    private var decrementButton: UIButton!
    private var currentCountLabel: UILabel!
    private var incrementButton: UIButton!
    
    // MARK: Delegate
    weak var delegate: CartCollectionViewCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        titleLabel = UILabel()
        contentView.addSubview(titleLabel)
        
        let layout = UICollectionViewFlowLayout()
        ingredientsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        contentView.addSubview(ingredientsCollectionView)
        
        decrementButton = UIButton(type: .contactAdd)
        decrementButton.tintColor = .acaiBlackTwo
        // TODO: Add button action
        
        currentCountLabel = UILabel()
        currentCountLabel.textColor = .acaiBlack
        currentCountLabel.font = UIFont.avenirNextBold.withSize(14)
        currentCountLabel.text = "1"
        contentView.addSubview(currentCountLabel)
        
        incrementButton = UIButton(type: .contactAdd)
        incrementButton.tintColor = .acaiBlackTwo
        // TODO: Add button action

        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Constraint setup
    private func setUpConstraints() {
        ingredientsCollectionView.snp.makeConstraints { _ in
            
        }
    }
}
