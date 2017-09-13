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
        newShiftView.navigationBar.backButtonSetAction(self, action: #selector(backButtonDidPress))
        newShiftView.navigationBar.actionButtonSetAction(self, action: #selector(saveButtonDidPress))
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
