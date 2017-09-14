//
//  ExtraShiftTableViewCell.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout

final class ShiftTableViewCell: BaseShiftCell {

    override func commonInit() {
        leftInset = Spacing.HorizontalSpacing
        selectionStyle = .none
        super.commonInit()
    }
}

final class ExtraShiftTableViewCell: BaseShiftCell {
    
    override func commonInit() {
        leftInset = 3 * Spacing.HorizontalSpacing
        super.commonInit()
    }
}
