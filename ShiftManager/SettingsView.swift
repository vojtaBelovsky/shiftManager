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
    
    init() {
        super.init(frame: .zero)

        setupViewItems()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViewItems() {
        backgroundColor = .white
        addSubview(userView)
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.register(ShiftTableViewCell.self, forCellReuseIdentifier: String(describing: ShiftTableViewCell.self))
        tableView.delegate = self
        addSubview(tableView)
        addSubview(userBarView)
        tableView.separatorStyle = UITableViewCellSeparatorStyle(rawValue: 0)!
        
    }

    fileprivate func setupConstraints() {
        userView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        
        tableView.autoPinEdge(.top, to: .bottom, of: userView)
        tableView.autoPinEdge(toSuperviewEdge: .leading)
        tableView.autoPinEdge(toSuperviewEdge: .trailing)

        userBarView.autoPinEdge(.top, to: .bottom, of: tableView)
        userBarView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
}
