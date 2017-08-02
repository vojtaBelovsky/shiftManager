//
//  EditShiftViewController.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 01/08/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class EditShiftViewController: NewShiftViewController {
    
    fileprivate let shift: ShiftModel

    init(shift: ShiftModel) {
        self.shift = shift
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        newShiftView.setupView(with: shift)
    }
    
    override func saveButtonDidPress() {
        shift.name = newShiftView.name()
        shift.date = newShiftView.date()
        
        if let interval = Int(newShiftView.interval()) {
            shift.interval = interval
        }
        
        //shift.color = newShiftView.backgroundColor
        
        ShiftManager.sharedInstance.saveShift(shift: shift)
    }
}
