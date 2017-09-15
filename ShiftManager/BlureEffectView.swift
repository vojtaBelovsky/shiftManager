//
//  BlureEffectView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 15.09.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class BlureEffectView: UIVisualEffectView {
    
    init() {
        super.init(effect: UIBlurEffect(style: .light))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
