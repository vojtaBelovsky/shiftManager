//
//  TemplatesView.swift
//  ShiftManager
//
//  Created by Jiří Tomis on 06.10.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class TemplatesView: UIView, UITableViewDelegate {
    
    let navigationBar = NavigationBar()
    let tableView = UITableView()
    
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
        navigationBar.setBackImage(#imageLiteral(resourceName: "backIcon"))
        navigationBar.setTitle("Předlohy")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        
        addSubview(navigationBar)
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.register(TemplatesTableViewCell.self, forCellReuseIdentifier: String(describing: TemplatesTableViewCell.self))
        tableView.delegate = self
        tableView.backgroundColor = textFields.textFieldColorWithAlpha
        addSubview(tableView)
    }
    
    fileprivate func setupConstraints() {
        navigationBar.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        navigationBar.autoSetDimension(.height, toSize: navigationBar.viewHeight)
        
        tableView.autoPinEdge(.top, to: .bottom, of: navigationBar)
        tableView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
    
}
