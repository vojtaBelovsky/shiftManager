//
//  ColorSelectView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 13.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class ColorSelectView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let space: CGFloat = 10.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear

        return collectionView
    }()
    
    fileprivate let numberOfCellsInCollum: Int = 4
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .white
        addSubview(collectionView)
    }
    
    fileprivate func setupConstraints() {
        collectionView.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
        collectionView.autoPinEdge(toSuperviewEdge: .leading)
        collectionView.autoPinEdge(toSuperviewEdge: .trailing)
        collectionView.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
    }
}

extension ColorSelectView {

    func getCellSize() -> CGSize {
        let size = (UIScreen.main.bounds.size.width / CGFloat(numberOfCellsInCollum)) - 10
        return CGSize(width: size, height: size)
    }
}
