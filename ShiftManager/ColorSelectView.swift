//
//  ColorSelectView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 13.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class ColorSelectView: UIView {
    
    var collectionView: UICollectionView!
    
    fileprivate let numberOfCellsInCollum: Int = 4

    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    
    func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .white
        let flowLayout = UICollectionViewFlowLayout()
        
        let space: CGFloat = 10.0
        flowLayout.itemSize = getCellSize()
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        
        addSubview(collectionView)
    }
    
    func setupConstraints() {
      //  collectionView.autoPinEdge(toSuperviewEdge: .top)
        collectionView.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
        collectionView.autoPinEdge(toSuperviewEdge: .leading)
        collectionView.autoPinEdge(toSuperviewEdge: .trailing)
        collectionView.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
    }
    
    fileprivate func getCellSize() -> CGSize {
        let size = (UIScreen.main.bounds.size.width / CGFloat(numberOfCellsInCollum)) - 10
        return CGSize(width: size, height: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
