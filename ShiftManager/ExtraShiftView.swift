//
//  ExtraShiftView.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout

final class ExtraShiftView: UIView {

    let tableView = UITableView()
    let navigationBar = NavigationBar()
    
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
        tableView.register(ShiftTableViewCell.self, forCellReuseIdentifier: String(describing: ShiftTableViewCell.self))
        tableView.separatorStyle = .none
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.isEditing = true
        tableView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        addSubview(tableView)
    }
    
    fileprivate func setupConstraints() {
        
        navigationBar.autoPinEdge(.bottom, to: .top, of: tableView)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        
        tableView.autoPinEdge(toSuperviewEdge: .leading)
        tableView.autoPinEdge(toSuperviewEdge: .trailing)
        tableView.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
