//
//  CalendarCollectionViewCell.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 iDevBand. All rights reserved.

import UIKit
import PureLayout

final class CalendarCollectionViewCell: UICollectionViewCell {

    fileprivate let dayLabel = UILabel()
    fileprivate let relayLabel = UILabel()
    fileprivate let cellView = UIView()
    
    fileprivate var date: Date? {
        didSet {
            setDayTitle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViewItems()
        labelSettings()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViewItems() {
        cellView.backgroundColor = .white
        dayLabel.textColor = .black
    }
    
    fileprivate func labelSettings() {
        backgroundColor = .white
        relayLabel.backgroundColor = .blue
        relayLabel.layer.masksToBounds = true
        relayLabel.textColor = .red
        relayLabel.textAlignment = .center
        relayLabel.adjustsFontSizeToFitWidth = true
    }
 
    fileprivate func addSubviews() {
        contentView.addSubview(cellView)
        cellView.addSubview(dayLabel)
        cellView.addSubview(relayLabel)
    }
    
    fileprivate func setupConstraints() {
        cellView.autoPinEdgesToSuperviewEdges()
        
        dayLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        dayLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        dayLabel.autoPinEdge(toSuperviewEdge: .top)
      
        relayLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        relayLabel.autoMatch(.height, to: .height, of: self.cellView, withMultiplier: 0.5)
        relayLabel.autoMatch(.width, to: .height, of: relayLabel)
        relayLabel.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        relayLabel.layer.cornerRadius = contentView.bounds.size.height/4;
    }
    
    fileprivate func setDayTitle() {
        guard let date = date, let dayIndex = date.component(.day) else { return }
        dayLabel.text = String(dayIndex)
    }
}

extension CalendarCollectionViewCell {

    func setDate(date: Date?) {
        self.date = date
    }
    
    func setShiftShortcut(_ shortcut: String) {
        relayLabel.text = shortcut
    }
}
