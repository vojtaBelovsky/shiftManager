//
//  BarView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 14.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

let refreshUserViewNotification = Notification.Name(rawValue:"RefreshUserViewProfil")

final class UserBarView: UIView {
    
    fileprivate let stackView = UIStackView()
    fileprivate lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 2
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    fileprivate let userBarViewDataSource = UserBarViewDataSource()
    fileprivate let viewHeight: CGFloat = 50.0
    fileprivate let cellDimension: CGFloat = 50.0
    
    init() {
        super.init(frame: .zero)
        
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        stackView.distribution = .fill
        stackView.axis = .horizontal
        addSubview(stackView)
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = userBarViewDataSource
        collectionView.delegate = self
        collectionView.register(UserBarCollectionCell.self, forCellWithReuseIdentifier: String(describing: UserBarCollectionCell.self))
        stackView.addArrangedSubview(collectionView)
    }
    
    fileprivate func setupConstraints() {
        stackView.autoSetDimension(.height, toSize: viewHeight)
        stackView.autoPinEdgesToSuperviewEdges()
    }
}

extension UserBarView {
    public func reloadData() {
        self.collectionView.reloadData()
    }
}

extension UserBarView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UserManager.sharedInstance.selectedUser = UserManager.sharedInstance.userForIndex(indexPath.row)
        reloadData()
        NotificationCenter.default.post(name: refreshUserViewNotification, object: nil)
    }
}
