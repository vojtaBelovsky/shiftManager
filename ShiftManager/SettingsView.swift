//
//  SettingsView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 30.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class SettingsView: UIView, UITableViewDelegate {
    
    let userView = UserView()
    let tableView = UITableView()
    let userBarView = UserBarView()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubview(userView)
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: settingsTableViewCellReuseIdentifier)
        tableView.delegate = self
        addSubview(tableView)
        addSubview(userBarView)
        setupConstraints()
    }

    func setupConstraints() {
        userView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        
        tableView.autoPinEdge(.top, to: .bottom, of: userView)
        tableView.autoPinEdge(toSuperviewEdge: .leading)
        tableView.autoPinEdge(toSuperviewEdge: .trailing)

        userBarView.autoPinEdge(.top, to: .bottom, of: tableView)
        userBarView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
