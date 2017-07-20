//
//  MonthCollectionView.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 19/07/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class CalendarHeaderView: UICollectionReusableView {
    
    static let calendarHeaderIdentifier = "calendarHeaderIdentifier"
    
    var monthLabel = UILabel()
    
    override init(frame: CGRect) {   
        super.init(frame: frame)
        
        addSubviews()
        labelSettings()
    }
    
     func labelSettings() {
        
        backgroundColor = .black
    
        monthLabel.textColor = .white
     }
    
    func addSubviews() {
        addSubview(monthLabel)
        
        monthLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        monthLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
