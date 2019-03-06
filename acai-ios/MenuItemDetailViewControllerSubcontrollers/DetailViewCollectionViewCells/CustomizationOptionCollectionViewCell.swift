//
//  CustomizationOptionCollectionViewCell.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/5/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import SnapKit

class CustomizationOptionCollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    var optionsLabel: UILabel!
    var path: UIBezierPath!
    var arrow: CAShapeLayer!
    var line: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = ""
        titleLabel.font = Acai.avenirNextMedium.withSize(20)
        titleLabel.textColor = Acai.darkGray
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width - 1, y: 1/2*self.frame.height))
        path.addLine(to: CGPoint(x: self.frame.width - 8, y: 1/2*self.frame.height - 7))
        path.move(to: CGPoint(x: self.frame.width - 1, y: 1/2*self.frame.height))
        path.addLine(to: CGPoint(x: self.frame.width - 8, y: 1/2*self.frame.height + 7))
        path.close()
        
        arrow = CAShapeLayer()
        arrow.strokeColor = Acai.orange.cgColor
        arrow.path = path.cgPath
        arrow.lineCap = CAShapeLayerLineCap.round
        arrow.lineWidth = 2
        arrow.lineJoin = CAShapeLayerLineJoin.round
        self.layer.addSublayer(arrow)
        
        optionsLabel = UILabel()
        optionsLabel.translatesAutoresizingMaskIntoConstraints = false
        optionsLabel.text = ""
        optionsLabel.font = Acai.avenirNextMedium.withSize(16)
        optionsLabel.textColor = Acai.medGray
        optionsLabel.textAlignment = .right
        self.addSubview(optionsLabel)
        optionsLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-18)
            make.centerY.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.trailing).offset(20)
        }
        
        line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = Acai.lineGray
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
