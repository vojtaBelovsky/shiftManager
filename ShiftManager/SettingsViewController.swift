//
//  SettingsViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 30.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate {
    
    let dataSource = SettingsTableViewDataSource()
    let settingsView = SettingsView()
    let settingsViewController = UIViewController()
    
    override func loadView() {
        self.view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Settings_loc002", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(settingsButtonDidPress))
        settingsView.tableView.dataSource = dataSource
        settingsView.tableView.delegate = self
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(loadList), name: myNotification, object: nil)

        ShiftManager.sharedInstance.getShifts().forEach { shiftModel in
            print("shift name: \(shiftModel.name)")
        }
    }
    
    func loadList(){
        settingsView.tableView.reloadData()
    }
    
    func settingsButtonDidPress() {
        self.navigationController?.pushViewController(NewShiftViewController(), animated: true)
    }
}
