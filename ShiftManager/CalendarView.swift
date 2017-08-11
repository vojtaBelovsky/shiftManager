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
    var daysLabel = UILabel()
    var addFriend = UIButton()
    
    lazy var calendarCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.headerReferenceSize = CGSize(width: 400, height: 20)

        let calendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return calendarCollectionView
    }()
    lazy var friendsCollectionVIew: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 6
        flowLayout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    fileprivate let numberOfCalendarCellsInCollum: Int = 7
    fileprivate let numberOfFriendsCellsInCollum: Int = 5
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        addFriend.backgroundColor = .white
        addFriend.setTitle(NSLocalizedString("AddFriendButton_loc001", comment: ""), for: .normal)
        addFriend.setTitleColor(.black, for: UIControlState.normal)
        addFriend.layer.borderColor = UIColor.black.cgColor
        addFriend.layer.borderWidth = 1
        addSubview(addFriend)

        
        calendarCollectionView.backgroundColor = .clear
        friendsCollectionVIew.backgroundColor = .clear
        
        addSubview(headerView)
        addSubview(calendarCollectionView)
        addSubview(friendsCollectionVIew)
    }
    
    fileprivate func setupConstraints() {
        headerView.autoPinEdge(toSuperviewEdge: .top)
        headerView.autoMatch(.width, to: .width, of: self)
        headerView.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        calendarCollectionView.autoPinEdge(.top, to: .bottom, of: headerView)
        calendarCollectionView.autoPinEdge(toSuperviewEdge: .leading)
        calendarCollectionView.autoPinEdge(toSuperviewEdge: .trailing)
        
        friendsCollectionVIew.autoMatch(.height, to: .height, of: self, withMultiplier: 0.12)
        friendsCollectionVIew.autoPinEdge(.top, to: .bottom, of: calendarCollectionView)
        friendsCollectionVIew.autoPinEdge(toSuperviewEdge: .leading)
        friendsCollectionVIew.autoPinEdge(toSuperviewEdge: .bottom)
        
        addFriend.autoMatch(.height, to: .height, of: friendsCollectionVIew)
        addFriend.autoMatch(.width, to: .height, of: addFriend)
        addFriend.autoPinEdge(.top, to: .bottom, of: calendarCollectionView)
        addFriend.autoPinEdge(.leading, to: .trailing, of: friendsCollectionVIew)
        addFriend.autoPinEdge(toSuperviewEdge: .trailing)
    }
}

extension CalendarView {
    func getCalendarCellSize() -> CGSize {
        let size = UIScreen.main.bounds.size.width / CGFloat(numberOfCalendarCellsInCollum)
        return CGSize(width: size, height: size)
    }
    
    func getFriendsCellSize() -> CGSize {
        let size = UIScreen.main.bounds.size.width / CGFloat(numberOfFriendsCellsInCollum)
        return CGSize(width: size, height: size)
    }
}
