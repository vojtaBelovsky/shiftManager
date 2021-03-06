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
    
    let navigationBar = NavigationBar()
    fileprivate let headerView = HeaderView()
    fileprivate let daysLabel = UILabel()
    let userBarView = UserBarView()
    let blureEfectView = BlureEffectView()
    
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
        calendarCollectionView.contentInset = UIEdgeInsetsMake(navigationBar.viewHeight + headerView.viewHeight, 3, userBarView.viewHeight, 3)

        addSubview(calendarCollectionView)
        addSubview(blureEfectView)
        addSubview(navigationBar)
        addSubview(headerView)
        addSubview(userBarView)
    }
    
    fileprivate func setupConstraints() {
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoSetDimension(.height, toSize: navigationBar.viewHeight)
        
        headerView.autoPinEdge(.top, to: .bottom, of: navigationBar)
        headerView.autoMatch(.width, to: .width, of: self)
        headerView.autoSetDimension(.height, toSize: headerView.viewHeight)
        
        blureEfectView.autoPinEdge(toSuperviewEdge: .top)
        blureEfectView.autoPinEdge(toSuperviewEdge: .leading)
        blureEfectView.autoPinEdge(toSuperviewEdge: .trailing)
        blureEfectView.autoPinEdge(.bottom, to: .bottom, of: headerView)
        
        calendarCollectionView.autoPinEdgesToSuperviewEdges()
        
        userBarView.autoSetDimension(.height, toSize: userBarView.viewHeight)
        userBarView.autoPinEdge(toSuperviewEdge: .leading)
        userBarView.autoPinEdge(toSuperviewEdge: .trailing)
        userBarView.autoPinEdge(toSuperviewEdge: .bottom)
    }
}

extension CalendarView {
    func getCalendarCellSize() -> CGSize {
        let width = UIScreen.main.bounds.size.width / CGFloat(numberOfCalendarCellsInCollum) - 4
        let height = UIScreen.main.bounds.size.width / CGFloat(numberOfCalendarCellsInCollum) + 10
        return CGSize(width: width, height: height)
    }
}
