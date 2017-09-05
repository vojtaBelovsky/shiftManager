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
    fileprivate let relayLabel = CalendarCircleLabel()
    fileprivate let relayView = UIView()
    fileprivate let cellView = UIView()
    fileprivate let extraFirstLabel = CalendarCircleLabel()
    fileprivate let extraSecondLabel = CalendarCircleLabel()
    fileprivate let extraThirdLabel = CalendarCircleLabel()
    
    fileprivate var date: Date? {
        didSet {
            setDayTitle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        extraFirstLabel.text = ""
        extraSecondLabel.text = ""
        extraThirdLabel.text = ""
        
        extraFirstLabel.backgroundColor = .green
        extraSecondLabel.backgroundColor = .blue
        extraThirdLabel.backgroundColor = .red

        setupViewItems()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViewItems() {
        cellView.backgroundColor = UIColor(red: 50.0/255, green: 150.0/255, blue: 65.0/255, alpha: 1.0)
        dayLabel.textColor = .black
        
        relayView.backgroundColor = .clear
    }
 
    fileprivate func addSubviews() {
        contentView.addSubview(cellView)
        cellView.addSubview(dayLabel)
        cellView.addSubview(relayView)
        relayView.addSubview(extraThirdLabel)
        relayView.addSubview(extraSecondLabel)
        relayView.addSubview(extraFirstLabel)
        relayView.addSubview(relayLabel)
    }
    
    fileprivate func setupConstraints() {
        cellView.autoPinEdge(toSuperviewEdge: .top)
        cellView.autoPinEdge(toSuperviewEdge: .bottom)
        cellView.autoPinEdge(toSuperviewEdge: .leading, withInset: 3)
        cellView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 3)
        
        dayLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        dayLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        dayLabel.autoPinEdge(toSuperviewEdge: .top)
      
        relayView.autoMatch(.height, to: .height, of: self.cellView, withMultiplier: 0.5)
        relayView.autoPinEdge(toSuperviewEdge: .bottom)
        relayView.autoPinEdge(toSuperviewEdge: .leading)
        relayView.autoPinEdge(toSuperviewEdge: .trailing)
        
        if extraThirdLabel.text != "" {
            
            relayLabel.autoPinEdge(toSuperviewEdge: .top)
            relayLabel.autoAlignAxis(.vertical, toSameAxisOf: relayView, withOffset: -16)
            relayLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.6)
            relayLabel.autoMatch(.width, to: .height, of: relayLabel)
            
            extraFirstLabel.autoPinEdge(toSuperviewEdge: .top)
            extraFirstLabel.autoAlignAxis(.vertical, toSameAxisOf: relayView, withOffset: 5)
            extraFirstLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.6)
            extraFirstLabel.autoMatch(.width, to: .height, of: extraFirstLabel)
            
            extraSecondLabel.autoAlignAxis(.vertical, toSameAxisOf: relayView, withOffset: -5)
            extraSecondLabel.autoPinEdge(toSuperviewEdge: .bottom)
            extraSecondLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.6)
            extraSecondLabel.autoMatch(.width, to: .height, of: extraSecondLabel)
            
            extraThirdLabel.autoAlignAxis(.vertical, toSameAxisOf: relayView, withOffset: 16)
            extraThirdLabel.autoPinEdge(toSuperviewEdge: .bottom)
            extraThirdLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.6)
            extraThirdLabel.autoMatch(.width, to: .height, of: extraThirdLabel)
            
        } else if extraSecondLabel.text != "" {
            
            relayLabel.autoPinEdge(toSuperviewEdge: .top)
            relayLabel.autoAlignAxis(.vertical, toSameAxisOf: relayView, withOffset: -13)
            relayLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.7)
            relayLabel.autoMatch(.width, to: .height, of: relayLabel)
            
            extraFirstLabel.autoPinEdge(toSuperviewEdge: .top)
            extraFirstLabel.autoAlignAxis(.vertical, toSameAxisOf: relayView, withOffset: 13)
            extraFirstLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.7)
            extraFirstLabel.autoMatch(.width, to: .height, of: extraFirstLabel)
            
            extraSecondLabel.autoPinEdge(toSuperviewEdge: .bottom)
            extraSecondLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            extraSecondLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.7)
            extraSecondLabel.autoMatch(.width, to: .height, of: extraSecondLabel)
            
        } else if extraFirstLabel.text != "" {
            
            relayLabel.autoPinEdge(toSuperviewEdge: .leading)
            relayLabel.autoMatch(.height, to: .height, of: relayView)
            relayLabel.autoMatch(.width, to: .height, of: relayLabel)
            relayLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
            
            extraFirstLabel.autoPinEdge(toSuperviewEdge: .trailing)
            extraFirstLabel.autoMatch(.height, to: .height, of: relayView)
            extraFirstLabel.autoMatch(.width, to: .height, of: extraFirstLabel)
            extraFirstLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
            
        } else {
            relayLabel.autoAlignAxis(toSuperviewAxis: .vertical)
            relayLabel.autoMatch(.height, to: .height, of: relayView)
            relayLabel.autoMatch(.width, to: .height, of: relayView)
            relayLabel.autoPinEdge(toSuperviewEdge: .bottom)
        }
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
    
    func setup(with shift: ShiftModel?) {
        relayLabel.text = shift?.shortcut ?? ""
        relayLabel.backgroundColor = shift?.color ?? .clear
    }
}
