//
//  CalendarCollectionViewCell.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.

import UIKit
import PureLayout

let calendarCollectionViewCellReuseIdentifier = "calendarCollectionViewCellReuseIdentifier"

class CalendarCollectionViewCell: UICollectionViewCell {

    let dayLabel = UILabel()
    let relayLabel = UILabel()
    let cellView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewItems()
        labelSettings()
        addSubviews()
        setupConstraints()
    }
    
    func setupViewItems() {
        cellView.backgroundColor = .white
        dayLabel.textColor = .black
    }
    
    func labelSettings() {
        backgroundColor = .white
        relayLabel.text = "A"
        relayLabel.textColor = .red
    }
 
    func addSubviews() {
        contentView.addSubview(cellView)
        cellView.addSubview(dayLabel)
        cellView.addSubview(relayLabel)
    }
    
    func setupConstraints() {
        cellView.autoPinEdgesToSuperviewEdges()
        
        dayLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        dayLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        dayLabel.autoPinEdge(toSuperviewEdge: .top)
      
        relayLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        relayLabel.autoMatch(.height, to: .height, of: self.cellView, withMultiplier: 0.5)
        relayLabel.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
