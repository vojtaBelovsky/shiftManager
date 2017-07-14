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
    
    let tableView = UITableView()
    let dataSource = SettingsTableViewDataSource()
    
    init() {
        super.init(frame: .zero)
        
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: settingsTableViewCellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = dataSource
        addSubview(tableView)
        setupConstraints()
    }
    
    func setupConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
