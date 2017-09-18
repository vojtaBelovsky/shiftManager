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
        tableView.register(ExtraShiftTableViewCell.self, forCellReuseIdentifier: String(describing: ExtraShiftTableViewCell.self))
        tableView.separatorStyle = .none
        tableView.allowsMultipleSelectionDuringEditing = true
        tableView.isEditing = true
        tableView.backgroundColor = textFields.textFieldColorWithAlpha
        addSubview(tableView)
    }
    
    fileprivate func setupConstraints() {
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoSetDimension(.height, toSize: navigationBar.viewHeight)
        
        tableView.autoPinEdge(.top, to: .bottom, of: navigationBar)
        tableView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
