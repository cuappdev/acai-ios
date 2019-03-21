//
//  BowlOrderDetailViewController.swift
//  acai-ios
//
//  Created by Artesia Ko on 3/17/19.
//  Copyright © 2019 Cornell AppDev. All rights reserved.
//

import UIKit
import IGListKit
import SnapKit

protocol DidSelectOptionDelegate: class {
    func deselectOption(at index: Int)
    func selectOption(at index: Int, type: OrderCustomizationOptionType)
}

class BowlOrderDetailViewController: UIViewController {
    
    // MARK: View vars
    var addToCartActionTabView: ActionTabView!
    var backButtonImageView: UIImageView!
    var backgroundGradient: CAGradientLayer!
    var bottomFillerRect: UIView!
    var collectionBottomFillerRect: UIView!
    var collectionView: UICollectionView!
    var listAdapter: ListAdapter!
    var titleLabel: UILabel!
    
    // MARK: Gesture recognizers
    var addToCartTapGestureRecognizer: UITapGestureRecognizer!
    var backButtonTapGestureRecognizer: UITapGestureRecognizer!
    
    // MARK: Data
    var baseOptions: [OrderCustomizationOption]!
    var bowlItem: BowlItem!
    var toppingOptions: [OrderCustomizationOption]!
    
    // MARK: Constraint Constants
    let addToCartActionTabViewHeight = 55
    let backButtonLeadingOffset = 18
    let backButtonHeight = 15
    let backButtonWidth = 8.7
    let emptyItemHeight: CGFloat = 156
    let titleLabelTopOffset = 5.5
    
    // MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .acaiColdGray
        navigationController?.isNavigationBarHidden = true
        
        // hard code
        bowlItem = Acai.testBowl
        toppingOptions = bowlItem.toppingOptions
        baseOptions = bowlItem.baseOptions
        
        backgroundGradient = CAGradientLayer()
        backgroundGradient.colors = [UIColor.gradientYellowOrange.cgColor, UIColor.gradientOrange.cgColor]
        backgroundGradient.locations = [0, 1]
        backgroundGradient.startPoint = CGPoint(x: 0, y: 1)
        backgroundGradient.endPoint = CGPoint(x: 100, y: 1)
        backgroundGradient.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.layer.addSublayer(backgroundGradient)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.avenirNextBold.withSize(24)
        titleLabel.textColor = .white
        titleLabel.text = bowlItem.title
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(titleLabelTopOffset)
        }
        
        backButtonImageView = UIImageView()
        backButtonImageView.backgroundColor = .white
        backButtonImageView.image = UIImage()
        backButtonImageView.contentMode = .scaleAspectFit
        backButtonImageView.isUserInteractionEnabled = true
        view.addSubview(backButtonImageView)
        
        backButtonImageView.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.height.equalTo(backButtonHeight)
            make.leading.equalToSuperview().offset(backButtonLeadingOffset)
            make.width.equalTo(backButtonWidth)
        }
        
        backButtonTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(popBowlOrderDetailViewController))
        backButtonImageView.addGestureRecognizer(backButtonTapGestureRecognizer)
        
        addToCartActionTabView = ActionTabView(frame: .zero, title: "Add to Cart", price: bowlItem.price)
        view.addSubview(addToCartActionTabView)
        
        addToCartActionTabView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-addToCartActionTabViewHeight)
        }
        
        addToCartTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addToCart))
        addToCartActionTabView.addGestureRecognizer(addToCartTapGestureRecognizer)
        
        bottomFillerRect = UIView()
        bottomFillerRect.backgroundColor = .acaiBlack
        view.addSubview(bottomFillerRect)
        
        bottomFillerRect.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.alwaysBounceVertical = true
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.bottom.equalTo(addToCartActionTabView.snp.top)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
        }
        
        listAdapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        listAdapter.collectionView = collectionView
        listAdapter.dataSource = self
        
        collectionBottomFillerRect = UIView()
        collectionBottomFillerRect.backgroundColor = .white
        view.addSubview(collectionBottomFillerRect)
        
        collectionBottomFillerRect.snp.makeConstraints { make in
            make.bottom.equalTo(addToCartActionTabView.snp.top)
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom)
        }
    }
    
    @objc func addToCart() {
        print("addToCart pushed")
    }
    
    @objc func popBowlOrderDetailViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func updateAddToCartPrice() {
        let totalPrice = toppingOptions.reduce(0) { (result, option) -> Double in
            return result + (option.isSelected ? option.price : 0)
            } + baseOptions.reduce(0) { (result, option) -> Double in
                return result + (option.isSelected ? option.price : 0)
        }
        addToCartActionTabView.priceLabel.text = "$\(totalPrice)"
    }

}

extension BowlOrderDetailViewController: ListAdapterDataSource {
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [
            EmptyItem(height: emptyItemHeight),
            HeaderItem(title: "Choose your base"),
            OrderCustomizationOptions(options: baseOptions),
            HeaderItem(title: "Choose your toppings"),
            OrderCustomizationOptions(options: toppingOptions)
        ]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if let object = object as? EmptyItem {
            return EmptySectionController(height: object.height, bowlItem: bowlItem)
        }
        if let object = object as? HeaderItem {
            let headerListSectionController = HeaderListSectionController(title: object.title)
            return headerListSectionController
        }
        if let object = object as? OrderCustomizationOptions {
            let orderCustomizationListSectionController = OrderCustomizationListSectionController(options: object)
            orderCustomizationListSectionController.selectOptionDelegate = self
            return orderCustomizationListSectionController
        }
        return ListSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
}

extension BowlOrderDetailViewController: DidSelectOptionDelegate {
    
    func deselectOption(at index: Int) {
        baseOptions[index].isSelected = false
    }
    
    func selectOption(at index: Int, type: OrderCustomizationOptionType) {
        switch type {
        case .base:
            baseOptions[index] = baseOptions[index].copy() as! OrderCustomizationOption
            baseOptions[index].isSelected.toggle()
            for option in baseOptions {
                print("\(option.title): \(option.isSelected)")
            }
        case .topping:
            toppingOptions[index] = toppingOptions[index].copy() as! OrderCustomizationOption
            toppingOptions[index].isSelected.toggle()
            for option in toppingOptions {
                print("\(option.title): \(option.isSelected)")
            }
        }
        updateAddToCartPrice()
        listAdapter.performUpdates(animated: false, completion: nil)
    }
    
}
