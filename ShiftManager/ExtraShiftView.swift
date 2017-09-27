//
//  ExtraShiftView.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout
import GoogleMobileAds

final class ExtraShiftView: UIView {
    
    let tableView = UITableView()
    let navigationBar = NavigationBar()
    var bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
    
    init() {
        super.init(frame: .zero)
        
        setupViewItems()
        setupConstraints()
        navigationBar.setTitle(NSLocalizedString("EditCallendarDayViewTitle_loc002", comment: ""))
        navigationBar.setImage(#imageLiteral(resourceName: "doneIcon"))
        navigationBar.setBackImage(#imageLiteral(resourceName: "backIcon"))
    }
    
    fileprivate func setupViewItems() {
        backgroundColor = .clear
        
        addSubview(navigationBar)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.register(ExtraShiftTableViewCell.self, forCellReuseIdentifier: String(describing: ExtraShiftTableViewCell.self))
        tableView.separatorStyle = .none
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.isEditing = true
        tableView.backgroundColor = textFields.textFieldColorWithAlpha
        addSubview(tableView)
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        addSubview(bannerView)
    }
    
    fileprivate func setupConstraints() {
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoSetDimension(.height, toSize: navigationBar.viewHeight)
        
        tableView.autoPinEdge(.top, to: .bottom, of: navigationBar)
        tableView.autoPinEdge(toSuperviewEdge: .leading)
        tableView.autoPinEdge(toSuperviewEdge: .trailing)
        
        bannerView.autoPinEdge(.top, to: .bottom, of: tableView)
        bannerView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
