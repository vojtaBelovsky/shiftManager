//
//  SettingsViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 30.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func loadView() {
        self.view = SettingsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Settings_loc002", comment: "")
         navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(settingsButtonDidPress))
               }
    
    func settingsButtonDidPress() {        
        self.navigationController?.pushViewController(NewShiftViewController(), animated: true)
    }

}
