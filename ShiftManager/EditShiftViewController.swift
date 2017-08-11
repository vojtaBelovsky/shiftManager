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
        title = NSLocalizedString("CreateNewShift_loc009", comment: "")
        setupView()
    }
    
    fileprivate func setupView() {
        newShiftView.setupView(with: shift)
    }
    
    override func saveButtonDidPress() {
        shift.name = newShiftView.name()
        shift.shortcut = newShiftView.shortcut()
        shift.date = newShiftView.date()
       
        // PODMÍNKA (PŘESUNOUT JINAM)
        
        if newShiftColor == nil{
            newShiftView.selectShiftColorButton.backgroundColor = shift.color
        }
        else{
        shift.color = newShiftColor
        }
        
        // KONEC PODMÍNKY
        
        if let interval = Int(newShiftView.interval()) {
            shift.interval = interval
            print (interval)
        }
        
        if let validationError = ShiftModelValidator.validateShift(shift) {
            let alertController = UIAlertController(title: validationError.localizedDescription, message: validationError.localizedFailureReason, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("NewShiftAllert_loc004", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        else {
            ShiftManager.sharedInstance.saveShift(shift: shift)
            sendNotification()
            navigationController?.popViewController(animated:true)
        }
    }
}
