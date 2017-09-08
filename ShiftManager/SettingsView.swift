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
    
    let userBarView = UserBarView()
    let tableView = UITableView()
    let userView = UserView()
    let navigationBar = NavigationBar()
    let addUserButton = UIButton()
    let addNewShiftButton = UIButton()
    
    init() {
        super.init(frame: .zero)

        setupViewItems()
        setupConstraints()
        navigationBar.setTitle(NSLocalizedString("Settings_loc002", comment: ""))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViewItems() {
        addSubview(userView)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.register(ShiftTableViewCell.self, forCellReuseIdentifier: String(describing: ShiftTableViewCell.self))
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.clear.withAlphaComponent(0.3)
        addSubview(tableView)
        addSubview(userBarView)
        addSubview(navigationBar)
        
        addUserButton.setImage(UIImage.init(named: "addIcon.png"), for: .normal)
        addUserButton.backgroundColor = .clear
        addSubview(addUserButton)
        
        addNewShiftButton.setImage(UIImage.init(named: "addButtonIcon.png"), for: .normal)
        addNewShiftButton.backgroundColor = .clear
        addSubview(addNewShiftButton)
    }

    fileprivate func setupConstraints() {
        addUserButton.autoPinEdge(.leading, to: .trailing, of: userView)
        addUserButton.autoPinEdge(.top, to: .bottom, of: navigationBar)
        addUserButton.autoPinEdge(.bottom, to: .top, of: tableView)
        addUserButton.autoPinEdge(toSuperviewEdge: .trailing)
        
        navigationBar.autoPinEdge(.bottom, to: .top, of: userView)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        
        userView.autoPinEdge(toSuperviewEdge: .leading)
        userView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 60)
        
        tableView.autoPinEdge(.top, to: .bottom, of: userView)
        tableView.autoPinEdge(toSuperviewEdge: .leading)
        tableView.autoPinEdge(toSuperviewEdge: .trailing)
       
        addNewShiftButton.autoPinEdge(.bottom, to: .top, of: userBarView, withOffset: -15)
        addNewShiftButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 17)
        addNewShiftButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 350)
        addNewShiftButton.autoPinEdge(.top, to: .bottom, of: addUserButton, withOffset: 480)
        
        userBarView.autoPinEdge(.top, to: .bottom, of: tableView)
        userBarView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
}

extension SettingsView {
    
    public func addNewUserButtonDidPress(_ target: Any?, action: Selector) {
        addUserButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func addNewShiftButtonDidPress(_ target: Any?, action: Selector) {
        addNewShiftButton.addTarget(target, action: action, for: .touchUpInside)
    }
}
