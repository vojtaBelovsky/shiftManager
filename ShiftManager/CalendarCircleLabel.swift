//
//  CalendarCircleLabel.swift
//  ShiftManager
//
//  Created by Jiří Tomis on 31.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class CalendarCircleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.masksToBounds = true
        textColor = .black
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.height/2
    }
    
    public func setup(with shiftModel: ShiftModel?) {
        text = shiftModel?.shortcut ?? ""
        backgroundColor = shiftModel?.color ?? .clear
    }
}
