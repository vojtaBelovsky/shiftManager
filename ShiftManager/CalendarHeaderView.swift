//
//  MonthCollectionView.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 19/07/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout

final class CalendarHeaderView: UICollectionReusableView {
    
    fileprivate let monthLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
        labelSettings()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func labelSettings() {
        backgroundColor = UIColor.black.withAlphaComponent(0.02)
        monthLabel.textColor = .black
        monthLabel.font = .systemFont(ofSize: 22)
    }
    
    fileprivate func addSubviews() {
        addSubview(monthLabel)
        
        monthLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        monthLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
    }
}

extension CalendarHeaderView {

    func setMonthName(name: String) {
        monthLabel.text = name
    }
    
    func setCurrentMonth() {
        monthLabel.textColor = MaterialColors.red
    }
    
    func setDefaultStateToMonth() {
        monthLabel.textColor = .black
    }
}
