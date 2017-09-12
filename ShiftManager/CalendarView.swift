//
//  CalendarView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout

final class CalendarView: UIView {
    
    fileprivate let headerView = HeaderView()
    fileprivate let daysLabel = UILabel()
    let userBarView = UserBarView()
    let navigationBar = NavigationBar()
    
    lazy var calendarCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.headerReferenceSize = CGSize(width: 400, height: 30)

        let calendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return calendarCollectionView
    }()
    
    fileprivate let numberOfCalendarCellsInCollum: Int = 7
    
    init() {
        super.init(frame: .zero)
         //navigationBar.setBackImage(#imageLiteral(resourceName: "backIcon"))
        navigationBar.setImage(#imageLiteral(resourceName: "editIcon"))
        navigationBar.setTitle(NSLocalizedString("Calendar_loc001", comment: ""))
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        calendarCollectionView.backgroundColor = .clear
        userBarView.isAddUserButtonHidden = true

        addSubview(userBarView)
        addSubview(headerView)
        addSubview(calendarCollectionView)
        addSubview(navigationBar)
    }
    
    fileprivate func setupConstraints() {
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoPinEdge(.bottom, to: .top, of: headerView)
        
       // headerView.autoPinEdge(toSuperviewEdge: .top)
        headerView.autoMatch(.width, to: .width, of: self)
        headerView.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        calendarCollectionView.autoPinEdge(.top, to: .bottom, of: headerView)
        calendarCollectionView.autoPinEdge(toSuperviewEdge: .leading)
        calendarCollectionView.autoPinEdge(toSuperviewEdge: .trailing)
        
        userBarView.autoPinEdge(.top, to: .bottom, of: calendarCollectionView)
        userBarView.autoPinEdge(toSuperviewEdge: .leading)
        userBarView.autoPinEdge(toSuperviewEdge: .trailing)
        userBarView.autoPinEdge(toSuperviewEdge: .bottom)
    }
}

extension CalendarView {
    func getCalendarCellSize() -> CGSize {
        let width = UIScreen.main.bounds.size.width / CGFloat(numberOfCalendarCellsInCollum)
        let height = UIScreen.main.bounds.size.width / CGFloat(numberOfCalendarCellsInCollum) + 10
        return CGSize(width: width, height: height)
    }
}
