//
//  HeaderView.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 10/07/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class HeaderView: UIView {
    
    let stackView = UIStackView()
    fileprivate var dayMon = UILabel()
    fileprivate var dayTues = UILabel()
    fileprivate var dayWedn = UILabel()
    fileprivate var dayThur = UILabel()
    fileprivate var dayFri = UILabel()
    fileprivate var daySat = UILabel()
    fileprivate var daySun = UILabel()
    
    init() {
        super .init(frame: .zero)
        stackViewInitilizer()
        setupConstraints()
    }
    
    func stackViewInitilizer() {
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        
        // smazat a zmenit na dynamicke pojmenovani podle systemu
        dayMon.text = "Po"
        dayTues.text = "Út"
        dayWedn.text = "St"
        dayThur.text = "Čt"
        dayFri.text = "Pá"
        daySat.text = "So"
        daySun.text = "Ne"
        
        addSubview(stackView)
        
        [dayMon, dayTues, dayWedn, dayThur, dayFri, daySat, daySun].forEach { daysLabel in
            daysLabel.textColor = .black
        }
        [dayMon, dayTues, dayWedn, dayThur, dayFri, daySat, daySun].forEach { label in
            stackView.addArrangedSubview(label)
        }
    }
    
    func setupConstraints() {
        stackView.autoPinEdge(toSuperviewEdge: .leading, withInset: 15)
        stackView.autoPinEdge(toSuperviewEdge: .top)
        stackView.autoMatch(.width, to: .width, of: self, withMultiplier: 0.9)
        stackView.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
