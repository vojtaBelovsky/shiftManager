//
//  SettingsView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 30.06.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout

final class SettingsView: UIView, UITableViewDelegate {
    
    let navigationBar = NavigationBar()
    let userView = UserView()
    let tableView = UITableView()
    let addNewShiftButton = NavigationButton()
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
        addSubview(navigationBar)
        addSubview(userView)
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        tableView.separatorColor = UIColor.black
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.register(ShiftTableViewCell.self, forCellReuseIdentifier: String(describing: ShiftTableViewCell.self))
        tableView.delegate = self
        tableView.backgroundColor = textFields.textFieldColorWithAlpha
        addSubview(tableView)
        
        addNewShiftButton.setImage(UIImage.init(named: "addButtonIcon.png"), for: .normal)
        addNewShiftButton.backgroundColor = textFields.textFieldColorWithAlpha
        addSubview(addNewShiftButton)
        addSubview(userBarView)
    }

    fileprivate func setupConstraints() {
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        
        userView.autoPinEdge(.top, to: .bottom, of: navigationBar)
        userView.autoPinEdge(toSuperviewEdge: .leading)
        userView.autoPinEdge(toSuperviewEdge: .trailing)
        
        tableView.autoPinEdge(.top, to: .bottom, of: userView)
        tableView.autoPinEdge(toSuperviewEdge: .leading)
        tableView.autoPinEdge(toSuperviewEdge: .trailing)
       
        addNewShiftButton.autoPinEdge(.bottom, to: .top, of: userBarView, withOffset: -15)
        addNewShiftButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 17)
        addNewShiftButton.autoSetDimensions(to: CGSize(width: 50, height: 50))
        
        userBarView.autoPinEdge(.top, to: .bottom, of: tableView)
        userBarView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
}

extension SettingsView {
    public func addNewUserButtonDidPress(_ target: Any?, action: Selector) {
    }
    
    public func addNewShiftButtonDidPress(_ target: Any?, action: Selector) {
        addNewShiftButton.addTarget(target, action: action, for: .touchUpInside)
    }
}
