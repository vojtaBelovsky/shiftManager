//
//  SettingsView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 30.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class SettingsView: UIView {
    
    let textLabel = UILabel ()
    let shiftButtonView = ShiftButtonView()
    
    init() {
        super.init(frame: .zero)
         addSubview(textLabel)
        addSubview(shiftButtonView)
        labelSettings()
        setupConstraints()
            }

    fileprivate func setupConstraints() {
        
        textLabel.autoAlignAxis(toSuperviewAxis: .vertical)
        textLabel.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.5)
        
        shiftButtonView.autoMatch(.width, to: .width, of: self, withMultiplier: 1.0)
        shiftButtonView.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        shiftButtonView.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    func labelSettings() {
        backgroundColor = .white
        textLabel.text = "Set your default shift :)"
        textLabel.textColor = .black
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
