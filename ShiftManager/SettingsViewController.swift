//
//  SettingsViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 30.06.17.
//  Copyright © 2017 iDevBand. All rights reserved.
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
        navigationController?.isNavigationBarHidden = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bcg")
        self.view.insertSubview(backgroundImage, at: 0)
        //title = NSLocalizedString("Settings_loc002", comment: "")
        
        setup()
    }
    
    fileprivate func setup() {
        settingsView.userView.addTarget(self, action: #selector(userViewButtonDidPress), for: .touchUpInside)
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(settingsButtonDidPress))
        settingsView.tableView.dataSource = dataSource
        settingsView.tableView.delegate = self
       
        settingsView.navigationBar.backButtonSetAction(self, action: #selector(backButtonDidPress))
        settingsView.addNewUserButtonDidPress(self, action: #selector(addNewUserDidPress))
        settingsView.addNewShiftButtonDidPress(self, action: #selector(settingsButtonDidPress))
        
        let tableViewReloadDataNotification = NotificationCenter.default
        tableViewReloadDataNotification.addObserver(self, selector: #selector(tableViewReloadData), name: NewShiftViewControllerHandler, object: nil)
        
        let newUserDidRegister = NotificationCenter.default
        newUserDidRegister.addObserver(self, selector: #selector(reloadDataNotificationHandler), name: newUserDidRegisterNotification, object: nil)
        
        let updateUser = NotificationCenter.default
        updateUser.addObserver(self, selector: #selector(reloadDataNotificationHandler), name: updateUserNotification, object: nil)
        
        let deleteUser = NotificationCenter.default
        deleteUser.addObserver(self, selector: #selector(reloadDataNotificationHandler), name: deleteUserNotification, object: nil)
        
        let refreshUserView = NotificationCenter.default
        refreshUserView.addObserver(self, selector: #selector(refreshScreen), name: refreshUserViewNotification, object: nil)
    }
    
    func tableViewReloadData(){
        settingsView.tableView.reloadData()
    }
    
    func reloadDataNotificationHandler() {
        settingsView.userView.reloadData()
        settingsView.userBarView.reloadData()
        tableViewReloadData()
    }
    
    func refreshScreen() {
        settingsView.userView.reloadData()
        tableViewReloadData()
    }

    func backButtonDidPress(){
        navigationController?.isNavigationBarHidden = false
         _ = navigationController?.popViewController(animated: true)
    }
    
    func settingsButtonDidPress() {
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(NewShiftViewController(), animated: true)
    }
    
    func addNewUserDidPress() {
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
        guard let shift = UserManager.sharedInstance.shiftForIndex(indexPath.row) else { return }
        navigationController?.pushViewController(EditShiftViewController(shift: shift), animated: true)
    }
}
