//
//  NavigationButton.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 11.09.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class NavigationButton: UIButton {

    override open func point(inside point: CGPoint, with _: UIEvent?) -> Bool {
        let margin: CGFloat = 25
        let area = self.bounds.insetBy(dx: -margin, dy: -margin)
        
        return area.contains(point)
    }
}
