//
//  CalendarView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class CalendarView: UIView {
    
    let headerView = HeaderView()
    var collectionView: UICollectionView!
    
    fileprivate let numberOfCellsInCollum: Int = 7
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeViewsAndAddThemAsSubviews() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let space: CGFloat = 10.0
        flowLayout.itemSize = getCellSize()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = space
        flowLayout.headerReferenceSize = CGSize(width: 400, height: 20)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        addSubview(headerView)
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        headerView.autoPinEdge(toSuperviewEdge: .top)
        headerView.autoMatch(.width, to: .width, of: self)
        headerView.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        collectionView.autoPinEdge(.top, to: .bottom, of: headerView)
        collectionView.autoPinEdge(toSuperviewEdge: .leading)
        collectionView.autoPinEdge(toSuperviewEdge: .trailing)
        collectionView.autoPinEdge(toSuperviewEdge: .bottom)
        
        collectionView.backgroundColor = .clear
    }
    
    fileprivate func getCellSize() -> CGSize {
        let size = UIScreen.main.bounds.size.width / CGFloat(numberOfCellsInCollum)
        return CGSize(width: size, height: size)
    }
}
