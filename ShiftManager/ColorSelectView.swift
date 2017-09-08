//
//  ColorSelectView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 13.07.17.
//  Copyright © 2017 iDevBand. All rights reserved.
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
       // backgroundColor = .white
        
        addSubview(collectionView)
    }
    
    fileprivate func setupConstraints() {
        collectionView.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
        collectionView.autoPinEdge(toSuperviewEdge: .leading, withInset: 5)
        collectionView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 5)
        collectionView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 5)
    }
}

extension ColorSelectView {

    func getCellSize() -> CGSize {
        let size = (UIScreen.main.bounds.size.width / CGFloat(numberOfCellsInCollum)) - 10
        return CGSize(width: size, height: size)
    }
}
