//
//  SettingsViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 30.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    fileprivate let dataSource = SettingsTableViewDataSource()
    fileprivate let settingsView = SettingsView()
    
    override func loadView() {
        self.view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Settings_loc002", comment: "")
        
        setup()
    }
    
    fileprivate func setup() {
        settingsView.userView.addTarget(self, action: #selector(userViewButtonDidPress), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(settingsButtonDidPress))
        settingsView.tableView.dataSource = dataSource
        settingsView.tableView.delegate = self
        settingsView.userBarView.setActionForAddButton(self, action: #selector(addButtonDidPress))
        
        //TODO: Přejmenovat!
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(loadList), name: myNotification, object: nil)
        
        let ncd = NotificationCenter.default
        ncd.addObserver(self, selector: #selector(newUserDidRegisterNotificationHandler), name: newUserDidRegisterNotification, object: nil)
        
        let nic = NotificationCenter.default
        nic.addObserver(self, selector: #selector(updateUserNotificationHandler), name: updateUserNotification, object: nil)
        
        let nec = NotificationCenter.default
        nec.addObserver(self, selector: #selector(deleteUserNotificationHandler), name: deleteUserNotification, object: nil)
    }
    
    func loadList(){
        settingsView.tableView.reloadData()
    }
    
    func deleteUserNotificationHandler(){
        settingsView.userView.reloadData()
        settingsView.userBarView.reloadData()
    }
    
    func newUserDidRegisterNotificationHandler(){
        settingsView.userView.reloadData()
        settingsView.userBarView.reloadData()
    }
    
    func updateUserNotificationHandler(){
        settingsView.userView.reloadData()
        settingsView.userBarView.reloadData()
    }
    
    func settingsButtonDidPress() {
        self.navigationController?.pushViewController(NewShiftViewController(), animated: true)
    }
    
    func addButtonDidPress(){
        self.navigationController?.pushViewController(NewUserViewController(), animated: true)
    }
    
    func userViewButtonDidPress(){
        if let selectedUser = UserManager.sharedInstance.selectedUser {
            self.navigationController?.pushViewController(EditUserViewController(user: selectedUser), animated: true)
        }
    }
}

extension SettingsViewController: UITableViewDelegate  {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shift = ShiftManager.sharedInstance.shiftForIndex(indexPath.row)
        navigationController?.pushViewController(EditShiftViewController(shift: shift), animated: true)
    }
}
