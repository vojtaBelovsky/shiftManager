//
//  ShiftViewModel.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

struct ShiftViewModel {
    let title: String
    let color: UIColor
    
    init(title: String, color: UIColor?) {
        self.title = title
        self.color = color ?? .clear
    }
}
