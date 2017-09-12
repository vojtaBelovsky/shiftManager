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
    let addNewShiftButton = NavigationButton()
    
    init() {
        super.init(frame: .zero)
        navigationBar.setBackImage(#imageLiteral(resourceName: "backIcon"))
        navigationBar.setImage(#imageLiteral(resourceName: "addIcon"))
        setupViewItems()
        setupConstraints()
        navigationBar.setTitle(NSLocalizedString("Settings_loc002", comment: ""))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViewItems() {
        
        addSubview(userView)
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.register(ShiftTableViewCell.self, forCellReuseIdentifier: String(describing: ShiftTableViewCell.self))
        tableView.delegate = self
        tableView.backgroundColor = textFields.textFieldColorWithAlpha
        
        addSubview(tableView)
        
       
        addSubview(userBarView)
        addSubview(navigationBar)
        addNewShiftButton.setImage(UIImage.init(named: "addButtonIcon.png"), for: .normal)
        addNewShiftButton.backgroundColor = textFields.textFieldColorWithAlpha
        addSubview(addNewShiftButton)
 
    }

    fileprivate func setupConstraints() {
        navigationBar.autoPinEdge(.bottom, to: .top, of: userView)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        
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
