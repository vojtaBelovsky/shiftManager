//
//  SettingsView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 30.06.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout
import GoogleMobileAds

final class SettingsView: UIView, UITableViewDelegate {
    
    let blureEffectView = BlureEffectView()
    let navigationBar = NavigationBar()
    let userView = UserView()
    let tableView = UITableView()
    let addNewShiftButton = NavigationButton()
    var bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
    let userBarView = UserBarView()
    
    init() {
        super.init(frame: .zero)
        navigationBar.setBackImage(#imageLiteral(resourceName: "backIcon"))
        navigationBar.setImage(#imageLiteral(resourceName: "addIcon"))
        navigationBar.setTitle(NSLocalizedString("Settings_loc002", comment: ""))
        setupViewItems()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViewItems() {
        addSubview(blureEffectView)
        addSubview(navigationBar)
        addSubview(userView)
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.register(ShiftTableViewCell.self, forCellReuseIdentifier: String(describing: ShiftTableViewCell.self))
        tableView.delegate = self
        tableView.backgroundColor = textFields.textFieldColorWithAlpha
        addSubview(tableView)
        
        setAddNewShiftButtonVisibility()
        
        addNewShiftButton.setImage(UIImage.init(named: "addButtonIcon.png"), for: .normal)
        addNewShiftButton.backgroundColor = textFields.textFieldColorWithAlpha
        addSubview(addNewShiftButton)
        
        bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        addSubview(bannerView)
        addSubview(userBarView)
    }
    
    fileprivate func setupConstraints() {
        blureEffectView.autoPinEdge(toSuperviewEdge: .top)
        blureEffectView.autoPinEdge(toSuperviewEdge: .leading)
        blureEffectView.autoPinEdge(toSuperviewEdge: .trailing)
        blureEffectView.autoPinEdge(.bottom, to: .top, of: tableView)
        
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoSetDimension(.height, toSize: navigationBar.viewHeight)
        
        userView.autoPinEdge(.top, to: .bottom, of: navigationBar)
        userView.autoPinEdge(toSuperviewEdge: .leading)
        userView.autoPinEdge(toSuperviewEdge: .trailing)
        
        tableView.autoPinEdge(.top, to: .bottom, of: userView)
        tableView.autoPinEdge(toSuperviewEdge: .leading)
        tableView.autoPinEdge(toSuperviewEdge: .trailing)
        
        addNewShiftButton.autoPinEdge(.bottom, to: .top, of: bannerView, withOffset: -15)
        addNewShiftButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 17)
        addNewShiftButton.autoSetDimensions(to: CGSize(width: 50, height: 50))
        
        bannerView.autoPinEdge(.top, to: .bottom, of: tableView)
        bannerView.autoPinEdge(toSuperviewEdge: .leading)
        bannerView.autoPinEdge(toSuperviewEdge: .trailing)
        
        userBarView.autoPinEdge(.top, to: .bottom, of: bannerView)
        userBarView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
}

extension SettingsView {
    public func addNewUserButtonDidPress(_ target: Any?, action: Selector) {
    }
    
    public func addNewShiftButtonDidPress(_ target: Any?, action: Selector) {
        addNewShiftButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func setAddNewShiftButtonVisibility() {
        addNewShiftButton.isHidden = UserManager.sharedInstance.selectedUser == nil
    }
}
