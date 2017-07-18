//
//  ShiftButtonSettingsViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 12.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit


class NewShiftViewController: UIViewController, ColorSelectViewDelegate {
    let newShiftView = NewShiftView()
    
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
        
    }

    func selectShiftColorButtonDidPress() {
        let colorController = ColorSelectViewController()
        colorController.delegate = self
        
        self.navigationController?.present(colorController, animated: true, completion: nil)
    }
    
    
}
