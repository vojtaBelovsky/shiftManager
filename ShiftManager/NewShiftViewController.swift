//
//  ShiftButtonSettingsViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 12.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class NewShiftViewController: UIViewController {
    
    let newShiftView = NewShiftView()
    
    override func loadView() {
        self.view = newShiftView
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create new shift"
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.newShiftView.setActionForColorButton(self, action: #selector(selectShiftColorButtonDidPress))
    }

    func selectShiftColorButtonDidPress() {
        self.navigationController?.present(ColorSelectViewController(), animated: true, completion: nil)
    }
    
    
}
