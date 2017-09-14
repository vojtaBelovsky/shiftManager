//
//  HeaderView.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 10/07/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout
import AFDateHelper

final class HeaderView: UIView {
    
    fileprivate let stackView = UIStackView()
    fileprivate let dayMon = UILabel()
    fileprivate let dayTues = UILabel()
    fileprivate let dayWedn = UILabel()
    fileprivate let dayThur = UILabel()
    fileprivate let dayFri = UILabel()
    fileprivate let daySat = UILabel()
    fileprivate let daySun = UILabel()
    
    init() {
        super.init(frame: .zero)
        stackViewInitilizer()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func stackViewInitilizer() {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        var i = 0
        [dayMon, dayTues, dayWedn, dayThur, dayFri, daySat, daySun].forEach { daysLabel in
            var date = Date()
            date = date.adjust(.day, offset: i)
            let dateFormatter = DateFormatter()
            let firstDay = (Calendar.current.firstWeekday + i - 1)%7
            daysLabel.text = dateFormatter.shortWeekdaySymbols[firstDay]
            i += 1
        }
        
        addSubview(stackView)
        
        [dayMon, dayTues, dayWedn, dayThur, dayFri, daySat, daySun].forEach { daysLabel in
            daysLabel.textColor = .black
            daysLabel.textAlignment = .center
            daysLabel.autoSetDimension(.width, toSize: 40)
            backgroundColor = UIColor.black.withAlphaComponent(0.02)
        }
        [dayMon, dayTues, dayWedn, dayThur, dayFri, daySat, daySun].forEach { label in
            stackView.addArrangedSubview(label)
        }
    }
    
    fileprivate func setupConstraints() {
        stackView.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        stackView.autoPinEdge(toSuperviewEdge: .top)
        stackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        stackView.autoPinEdge(toSuperviewEdge: .bottom)
    }
}

