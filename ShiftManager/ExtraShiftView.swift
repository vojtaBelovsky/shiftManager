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
    
    init() {
        super.init(frame: .zero)

        setupViewItems()
        setupConstraints()
    }
    
    fileprivate func setupViewItems() {
        backgroundColor = .white
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.register(ShiftTableViewCell.self, forCellReuseIdentifier: String(describing: ShiftTableViewCell.self))
        tableView.separatorStyle = .none
        addSubview(tableView)
    }
    
    fileprivate func setupConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
