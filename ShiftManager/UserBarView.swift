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
    fileprivate let addUserCircleLbl = CalendarCircleLabel()
    fileprivate let addUserLbl = UILabel()
    fileprivate lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 6
        flowLayout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    var isAddUserButtonHidden = false {
        didSet {
            addUserCircleLbl.isHidden = isAddUserButtonHidden
            addUserLbl.isHidden = isAddUserButtonHidden
        }
    }
    
    fileprivate let userBarViewDataSource = UserBarViewDataSource()
    fileprivate let viewHeight: CGFloat = 50.0
    fileprivate let cellDimension: CGFloat = 45.0
    
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
        
        collectionView.backgroundColor = .clear
        collectionView.dataSource = userBarViewDataSource
        collectionView.delegate = self
        collectionView.register(UserBarCollectionCell.self, forCellWithReuseIdentifier: String(describing: UserBarCollectionCell.self))
        stackView.addArrangedSubview(collectionView)

        addUserCircleLbl.backgroundColor = Colors.softRedClr
        addUserCircleLbl.layer.borderColor = UIColor.black.cgColor
        addUserCircleLbl.layer.borderWidth = 2
        addUserCircleLbl.isUserInteractionEnabled = true
        addSubview(addUserCircleLbl)
        
        addUserLbl.backgroundColor = .clear
        addUserLbl.font = UIFont.boldSystemFont(ofSize: 42)
        addUserLbl.text = "+"
        addSubview(addUserLbl)
    }
    
    fileprivate func setupConstraints() {
        stackView.autoSetDimension(.height, toSize: viewHeight)
        stackView.autoPinEdgesToSuperviewMargins()
        
        addUserCircleLbl.autoPinEdge(.bottom, to: .bottom, of: stackView, withOffset: 62)
        addUserCircleLbl.autoPinEdge(.trailing, to: .trailing, of: stackView, withOffset: 62)
        addUserCircleLbl.autoSetDimension(.height, toSize: 120)
        addUserCircleLbl.autoMatch(.width, to: .height, of: addUserCircleLbl)
        
        addUserLbl.autoMatch(.height, to: .height, of: stackView)
        addUserLbl.autoMatch(.width, to: .width, of: addUserLbl)
        addUserLbl.autoPinEdge(.trailing, to: .trailing, of: stackView, withOffset: -5)
        addUserLbl.autoPinEdge(.bottom, to: .bottom, of: stackView)
    }
}

extension UserBarView {
    public func reloadData() {
        self.collectionView.reloadData()
    }
    
    public func addGestureRecognizerToAddUserCircleLabel(_ gestureRecognizer: UIGestureRecognizer) {
        addUserCircleLbl.addGestureRecognizer(gestureRecognizer)
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
