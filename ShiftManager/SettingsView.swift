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
    
    let blureEffectView = BlureEffectView()
    let navigationBar = NavigationBar()
    let userView = UserView()
    let tableView = UITableView()
    let addNewShiftButton = UIButton()
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
        
        addNewShiftButton.setTitle((NSLocalizedString("CreateNewShift_loc002", comment: "")), for: .normal)
        addNewShiftButton.setTitleColor(Colors.nativeBlue, for: .normal)
        addSubview(addNewShiftButton)
        
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
        
        addNewShiftButton.autoPinEdge(.top, to: .bottom, of: userView)
        addNewShiftButton.autoPinEdge(toSuperviewEdge: .leading)
        addNewShiftButton.autoPinEdge(toSuperviewEdge: .trailing)
        addNewShiftButton.autoSetDimension(.height, toSize: 40)
        
        tableView.autoPinEdge(.top, to: .bottom, of: addNewShiftButton)
        tableView.autoPinEdge(toSuperviewEdge: .leading)
        tableView.autoPinEdge(toSuperviewEdge: .trailing)
        tableView.autoPinEdge(.bottom, to: .top, of: userBarView)
        
        userBarView.autoSetDimension(.height, toSize: userBarView.viewHeight)
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
