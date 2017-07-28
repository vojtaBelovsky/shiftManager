//
//  SettingsViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 30.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let dataSource = SettingsTableViewDataSource()
    let settingsView = SettingsView()
    
    override func loadView() {
        self.view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Settings_loc002", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(settingsButtonDidPress))
        settingsView.tableView.dataSource = dataSource
        
        // smazat
        ShiftManager.sharedInstance.getShifts().forEach { shiftModel in
            print("shift name: \(shiftModel.name)")
        }
        // smazat - konec
    }
    
    func settingsButtonDidPress() {
        self.navigationController?.pushViewController(NewShiftViewController(), animated: true)
    }
    
}
