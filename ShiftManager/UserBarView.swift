//
//  BarView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 14.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class UserBarView: UIView {
    let addButton = UIButton()
    
    let userBarViewDataSource = UserBarViewDataSource()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 6
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
     fileprivate let cellDimension: CGFloat = 50.0
    
    init() {
        super.init(frame: .zero)
        collectionView.dataSource = userBarViewDataSource
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        addButton.backgroundColor = .white
        addButton.setTitle(NSLocalizedString("AddFriendButton_loc001", comment: ""), for: .normal)
        addButton.setTitleColor(.black, for: UIControlState.normal)
        addButton.layer.borderColor = UIColor.black.cgColor
        addButton.layer.borderWidth = 1
        addSubview(addButton)
        
        collectionView.backgroundColor = .clear
        addSubview(collectionView)
    }
    
    fileprivate func setupConstraints() {
        collectionView.autoSetDimension(.height, toSize: 80.0)
        collectionView.autoPinEdge(toSuperviewEdge: .top)
        collectionView.autoPinEdge(toSuperviewEdge: .leading)
        collectionView.autoPinEdge(toSuperviewEdge: .bottom)
        
        addButton.autoMatch(.height, to: .height, of: collectionView)
        addButton.autoMatch(.width, to: .height, of: addButton)
        addButton.autoPinEdge(toSuperviewEdge: .top)
        addButton.autoPinEdge(.leading, to: .trailing, of: collectionView)
        addButton.autoPinEdge(toSuperviewEdge: .trailing)
    }
}

extension UserBarView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
}
