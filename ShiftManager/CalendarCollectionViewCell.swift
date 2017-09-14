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
    fileprivate let extraFourthLabel = CalendarCircleLabel()
    fileprivate var model: EditCalendarDayModel?
    fileprivate let stackView = UIStackView()
    fileprivate let toolbar = UIToolbar()
    
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
    
    fileprivate func setupViewItems() {
        toolbar.alpha = 0.7
        cellView.backgroundColor = .clear
        dayLabel.textColor = .black
        dayLabel.font = UIFont.boldSystemFont(ofSize: 18)
        dayLabel.textAlignment = .center
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
    }
    
    fileprivate func addSubviews() {
        contentView.addSubview(toolbar)
        contentView.addSubview(cellView)
        cellView.addSubview(relayView)
        cellView.addSubview(dayLabel)
        relayView.addSubview(relayLabel)
        addSubviewToStackView()
        relayView.addSubview(stackView)
    }
    
    fileprivate func addSubviewToStackView() {
        [getSpaceView(), extraFirstLabel, extraSecondLabel, extraThirdLabel, extraFourthLabel, getSpaceView()].forEach { subview in
            stackView.addArrangedSubview(subview)
        }
    }
    
    fileprivate func getSpaceView() -> UIView {
        let spaceView = UIView()
        spaceView.autoSetDimension(.width, toSize: 2)
        
        return spaceView
    }
    
    fileprivate func setupConstraints() {
        toolbar.autoPinEdge(toSuperviewEdge: .top)
        toolbar.autoPinEdge(toSuperviewEdge: .bottom)
        toolbar.autoPinEdge(toSuperviewEdge: .leading)
        toolbar.autoPinEdge(toSuperviewEdge: .trailing)
        
        cellView.autoPinEdge(toSuperviewEdge: .top)
        cellView.autoPinEdge(toSuperviewEdge: .bottom)
        cellView.autoPinEdge(toSuperviewEdge: .leading)
        cellView.autoPinEdge(toSuperviewEdge: .trailing)
        
        dayLabel.autoPinEdge(.top, to: .top, of: cellView)
        dayLabel.autoMatch(.height, to: .height, of: cellView, withMultiplier: 0.35)
        dayLabel.autoMatch(.width, to: .width, of: cellView)
        dayLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        
        relayView.autoPinEdge(.top, to: .bottom, of: dayLabel)
        relayView.autoMatch(.height, to: .height, of: cellView, withMultiplier: 0.65)
        relayView.autoPinEdge(.leading, to: .leading, of: cellView)
        relayView.autoPinEdge(.trailing, to: .trailing, of: cellView)
        
        relayLabel.autoPinEdge(.top, to: .top, of: relayView)
        relayLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        relayLabel.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.65)
        relayLabel.autoMatch(.width, to: .height, of: relayLabel)
        
        stackView.autoPinEdge(.bottom, to: .bottom, of: relayView, withOffset: -2)
        stackView.autoPinEdge(.leading, to: .leading, of: relayView)
        stackView.autoPinEdge(.trailing, to: .trailing, of: relayView)
        stackView.autoMatch(.height, to: .height, of: relayView, withMultiplier: 0.25)
        
        extraFirstLabel.autoMatch(.width, to: .height, of: stackView)
        extraSecondLabel.autoMatch(.width, to: .height, of: stackView)
        extraThirdLabel.autoMatch(.width, to: .height, of: stackView)
        extraFourthLabel.autoMatch(.width, to: .height, of: stackView)
    }
    
    public func setDefaultStateToLabels() {
        dayLabel.textColor = .black
        
        extraFirstLabel.isHidden = true
        extraSecondLabel.isHidden = true
        extraThirdLabel.isHidden = true
        extraFourthLabel.isHidden = true
        
        relayLabel.setup(with: nil)
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
        relayLabel.setup(with: shift)
    }
    
    func setupCurrentDay() {
        dayLabel.textColor = MaterialColors.red
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
                    extraFirstLabel.backgroundColor = shiftModel.color
                } else if (i == 1) {
                    extraSecondLabel.isHidden = false
                    extraSecondLabel.backgroundColor = shiftModel.color
                } else if (i == 2) {
                    extraThirdLabel.isHidden = false
                    extraThirdLabel.backgroundColor = shiftModel.color
                } else if (i == 3) {
                    extraFourthLabel.isHidden = false
                    extraFourthLabel.backgroundColor = shiftModel.color
                }
                i += 1
            })
        }
    }
}
