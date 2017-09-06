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
    fileprivate let relayView = UIView()
    fileprivate let cellView = UIView()
    fileprivate let extraFirstLabel = UILabel()
    fileprivate let extraSecondLabel = UILabel()
    fileprivate let extraThirdLabel = UILabel()
    fileprivate var model: EditCalendarDayModel?
    
    fileprivate var date: Date? {
        didSet {
            setDayTitle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViewItems()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func refreshCell() {
        contentView.removeConstraints(contentView.constraints)
        contentView.subviews.forEach { view in
            view.removeFromSuperview()
        }
        
        addSubviews()
        setupConstraints()
    }
    
    fileprivate func setupViewItems() {
        cellView.backgroundColor = UIColor(red: 50.0/255, green: 150.0/255, blue: 65.0/255, alpha: 1.0)
        dayLabel.textColor = .black
        dayLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        relayView.backgroundColor = .clear
        
        relayLabel.textAlignment = .center
        extraFirstLabel.textAlignment = .center
        extraSecondLabel.textAlignment = .center
        extraThirdLabel.textAlignment = .center
    }
 
    fileprivate func addSubviews() {
        contentView.addSubview(cellView)
        cellView.addSubview(relayView)
        relayView.addSubview(extraThirdLabel)
        relayView.addSubview(extraSecondLabel)
        relayView.addSubview(extraFirstLabel)
        relayView.addSubview(relayLabel)
        cellView.addSubview(dayLabel)
    }
    
    fileprivate func setupConstraints() {
        cellView.autoPinEdge(toSuperviewEdge: .top)
        cellView.autoPinEdge(toSuperviewEdge: .bottom)
        cellView.autoPinEdge(toSuperviewEdge: .leading, withInset: 3)
        cellView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 3)
        
        dayLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        dayLabel.autoMatch(.height, to: .height, of: self)
        dayLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
      
        relayView.autoPinEdge(.top, to: .top, of: cellView)
        relayView.autoPinEdge(.bottom, to: .bottom, of: cellView)
        relayView.autoPinEdge(.leading, to: .leading, of: cellView)
        relayView.autoPinEdge(.trailing, to: .trailing, of: cellView)
        
        relayLabel.autoPinEdge(toSuperviewEdge: .top)
        relayLabel.autoPinEdge(toSuperviewEdge: .leading)
        relayLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.5)
        relayLabel.autoMatch(.width, to: .width, of: relayView, withMultiplier: 0.5)
        
        extraFirstLabel.autoPinEdge(toSuperviewEdge: .top)
        extraFirstLabel.autoPinEdge(toSuperviewEdge: .trailing)
        extraFirstLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.5)
        extraFirstLabel.autoMatch(.width, to: .width, of: relayView, withMultiplier: 0.5)
        
        extraSecondLabel.autoPinEdge(toSuperviewEdge: .leading)
        extraSecondLabel.autoPinEdge(toSuperviewEdge: .bottom)
        extraSecondLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.5)
        extraSecondLabel.autoMatch(.width, to: .width, of: relayView, withMultiplier: 0.5)
        
        extraThirdLabel.autoPinEdge(toSuperviewEdge: .trailing)
        extraThirdLabel.autoPinEdge(toSuperviewEdge: .bottom)
        extraThirdLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.5)
        extraThirdLabel.autoMatch(.width, to: .width, of: relayView, withMultiplier: 0.5)

    }
    
    public func setDefaultStateToLabels() {
        
        extraFirstLabel.isHidden = true
        extraSecondLabel.isHidden = true
        extraThirdLabel.isHidden = true
        
        extraFirstLabel.text = ""
        extraSecondLabel.text = ""
        extraThirdLabel.text = ""
        
        extraFirstLabel.backgroundColor = .black
        extraSecondLabel.backgroundColor = .black
        extraThirdLabel.backgroundColor = .black
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
    
    func setupHoliday(with holidayShift: EditCalendarDayModel?) {
        model = holidayShift
        if holidayShift?.freeDay == true {
            relayLabel.text = "D"
            relayLabel.backgroundColor = Colors.holidayClr
        }
        if holidayShift?.extraShifts != nil {
            
            var i = 0
            holidayShift?.extraShifts.forEach({ shiftModel in
                if(i == 0) {
                    extraFirstLabel.isHidden = false
                    extraFirstLabel.text = shiftModel.shortcut
                    extraFirstLabel.backgroundColor = shiftModel.color
                } else if (i == 1) {
                    extraSecondLabel.isHidden = false
                    extraSecondLabel.text = shiftModel.shortcut
                    extraSecondLabel.backgroundColor = shiftModel.color
                } else if (i == 2) {
                    extraThirdLabel.isHidden = false
                    extraThirdLabel.text = shiftModel.shortcut
                    extraThirdLabel.backgroundColor = shiftModel.color
                }
                i += 1
            })
        }
    }
}
