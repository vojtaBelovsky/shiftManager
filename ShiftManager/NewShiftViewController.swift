//
//  ShiftButtonSettingsViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 12.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit


class NewShiftViewController: UIViewController, ColorSelectViewControllerDelegate {
    let newShiftView = NewShiftView()
    var newShiftColor: UIColor?
    
    override func loadView() {
        self.view = newShiftView
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("CreateNewShift_loc002", comment: "")
         navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonDidPress))
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.newShiftView.setActionForColorButton(self, action: #selector(selectShiftColorButtonDidPress))
    }
    
    func colorDidSet(color: UIColor) {
        newShiftView.selectShiftColorButton.backgroundColor = color
    }

    func saveButtonDidPress() {
        let shift = ShiftModel()
        shift.name = newShiftView.name()
        //shift.interval = newShiftView.interval()
        shift.date = newShiftView.date()
        shift.color = newShiftColor
        
        
        let nameString = newShiftView.name()
        let intervalString = newShiftView.interval()
       // let dateString = newShiftView.date()
        
        
        if nameString.isEmpty {
            let alertController = UIAlertController(title: NSLocalizedString("NewShiftAllert_loc001", comment: ""), message: NSLocalizedString("NewShiftAllert_loc002", comment: ""), preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("NewShiftAllert_loc004", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        if intervalString.isEmpty {
            let alertController = UIAlertController(title: NSLocalizedString("NewShiftAllert_loc001", comment: ""), message: NSLocalizedString("NewShiftAllert_loc003", comment: ""), preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("NewShiftAllert_loc004", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
               ShiftManager.sharedInstance.saveShift(shift: shift)
        print(UserDefaults.standard.dictionaryRepresentation())
    }

    func selectShiftColorButtonDidPress() {
        let colorController = ColorSelectViewController()
        colorController.delegate = self
        
        self.navigationController?.present(colorController, animated: true, completion: nil)
    }
    
    func colorSelectViewController(_ controller: ColorSelectViewController, didSelectColor: UIColor) {
        newShiftColor = didSelectColor
        newShiftView.selectShiftColorButton.backgroundColor = didSelectColor
        controller.dismiss(animated: true, completion: nil)
    }
}
