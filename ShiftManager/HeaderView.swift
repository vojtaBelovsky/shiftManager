//
//  HeaderView.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 10/07/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

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
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        
        var i = 0
        [dayMon, dayTues, dayWedn, dayThur, dayFri, daySat, daySun].forEach { daysLabel in
            var date = Date()
            date = date.adjust(.day, offset: i)
            let dateFormatter = DateFormatter()
            daysLabel.text = dateFormatter.shortWeekdaySymbols[i]
            i += 1
        }
        
        addSubview(stackView)
        
        [dayMon, dayTues, dayWedn, dayThur, dayFri, daySat, daySun].forEach { daysLabel in
            daysLabel.textColor = .black
            backgroundColor = UIColor.black.withAlphaComponent(0.02)
        }
        [dayMon, dayTues, dayWedn, dayThur, dayFri, daySat, daySun].forEach { label in
            stackView.addArrangedSubview(label)
        }
    }
    
    fileprivate func setupConstraints() {
        stackView.autoPinEdge(toSuperviewEdge: .leading, withInset: 15)
        stackView.autoPinEdge(toSuperviewEdge: .top)
        stackView.autoMatch(.width, to: .width, of: self, withMultiplier: 0.9)
        stackView.autoPinEdge(toSuperviewEdge: .bottom)
    }
}

