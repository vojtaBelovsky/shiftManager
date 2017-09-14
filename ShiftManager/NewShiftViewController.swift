//
//  ShiftButtonSettingsViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 12.07.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

let NewShiftViewControllerHandler = Notification.Name(rawValue:"ReloadNewShiftController")

class NewShiftViewController: UIViewController, ColorSelectViewControllerDelegate {
    
    let newShiftView = NewShiftView()
    internal var shift = ShiftModel()
    
    override func loadView() {
        view = newShiftView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bcg")
        self.view.insertSubview(backgroundImage, at: 0)
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        newShiftView.navigationBar.setBackButton(self, action: #selector(backButtonDidPress))
        newShiftView.navigationBar.setActionButton(self, action: #selector(saveButtonDidPress))
        newShiftView.setActionForColorButton(self, action: #selector(selectShiftColorButtonDidPress))
        newShiftView.renameButton()
    }
    
    func saveButtonDidPress() {
        shift.name = newShiftView.name()
        shift.shortcut = newShiftView.shortcut()
        shift.firstDateOfShift = newShiftView.date()
        shift.color = newShiftView.color()
        shift.interval = newShiftView.interval()
        
        if let validationError = ShiftModelValidator.validateShift(shift) {
            
            if validationError.code == shiftErrorType.shiftErrorTypeShiftName.rawValue {
                newShiftView.nameTextField.backgroundColor = .red
                newShiftView.shortcutTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.intervalTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.selectShiftColorButton.layer.borderColor = textFields.textFieldColorWithAlpha.cgColor
                newShiftView.selectShiftColorButton.layer.borderWidth = 0.0
                newShiftView.datePicker.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.selectFirstShiftDateLabel.backgroundColor = textFields.textFieldColorWithAlpha
            }
            
            if validationError.code == shiftErrorType.shiftErrorTypeShiftShortcut.rawValue {
                newShiftView.nameTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.shortcutTextField.backgroundColor = .red
                newShiftView.intervalTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.selectShiftColorButton.layer.borderColor = textFields.textFieldColorWithAlpha.cgColor
                newShiftView.selectShiftColorButton.layer.borderWidth = 0.0
                newShiftView.datePicker.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.selectFirstShiftDateLabel.backgroundColor = textFields.textFieldColorWithAlpha
            }
            
            if validationError.code == shiftErrorType.shiftErrorTypeShiftPicker.rawValue {
                newShiftView.nameTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.shortcutTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.intervalTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.selectShiftColorButton.layer.borderColor = textFields.textFieldColorWithAlpha.cgColor
                newShiftView.selectShiftColorButton.layer.borderWidth = 0.0
                newShiftView.datePicker.backgroundColor = .red
                newShiftView.selectFirstShiftDateLabel.backgroundColor = .red
            }
            
            if validationError.code == shiftErrorType.shiftErrorTypeShiftInterval.rawValue {
                newShiftView.nameTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.shortcutTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.intervalTextField.backgroundColor = .red
                newShiftView.selectShiftColorButton.layer.borderColor = textFields.textFieldColorWithAlpha.cgColor
                newShiftView.selectShiftColorButton.layer.borderWidth = 0.0
                newShiftView.datePicker.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.selectFirstShiftDateLabel.backgroundColor = textFields.textFieldColorWithAlpha
            }
            
            if validationError.code == shiftErrorType.shiftErrorTypeShiftColor.rawValue {
                newShiftView.nameTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.shortcutTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.intervalTextField.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.selectShiftColorButton.layer.borderColor = UIColor.red.cgColor
                newShiftView.selectShiftColorButton.layer.borderWidth = 1.0
                newShiftView.datePicker.backgroundColor = textFields.textFieldColorWithAlpha
                newShiftView.selectFirstShiftDateLabel.backgroundColor = textFields.textFieldColorWithAlpha
            }
            
            let alertController = UIAlertController(title: validationError.localizedDescription, message: validationError.localizedFailureReason, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("NewShiftAllert_loc004", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        } else {
            UserManager.sharedInstance.saveShift(shift: shift)
            sendNotification()
            _ = navigationController?.popViewController(animated:true)
        }
    }
    
    func backButtonDidPress(){
        _ = navigationController?.popViewController(animated: true)
    }
    
    func sendNotification() {
        let nc = NotificationCenter.default
        nc.post(name: NewShiftViewControllerHandler, object: nil)
    }
    
    func selectShiftColorButtonDidPress() {
        let colorController = ColorSelectViewController()
        colorController.delegate = self
        
        navigationController?.present(colorController, animated: true, completion: nil)
    }
    
    func colorSelectViewController(_ controller: ColorSelectViewController, didSelectColor: UIColor) {
        newShiftView.setSelectShiftColorButtonBackground(didSelectColor)
        controller.dismiss(animated: true, completion: nil)
    }
}
