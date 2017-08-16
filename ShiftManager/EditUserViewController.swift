//
//  EditUserViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 15.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

let updateUserNotification = Notification.Name(rawValue:"UpdateUserProfil")
let deleteUserNotification = Notification.Name(rawValue:"DeleteUserProfil")

final class EditUserViewController: NewUserViewController {
    
    fileprivate let user: UserModel
    
    init(user: UserModel) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("CreateNewShift_loc009", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteButtonDidPress))
        setupView()
    }
    
    fileprivate func setupView() {
        newUserView.editUserSetupView(with: user)
    }
    
    func deleteButtonDidPress(){
        UserManager.sharedInstance.deleteUser(at: 0)
        // TODO: poslat notku
        sendDeleteNotification()
        navigationController?.popViewController(animated:true)
        //  userView.reloadData()
        
    }
    func sendDeleteNotification() {
        let nec = NotificationCenter.default
        nec.post(name: updateUserNotification, object: nil)
    }
    
    
    override func sendNotification() {
        let nic = NotificationCenter.default
        nic.post(name: updateUserNotification, object: nil)
    }
    
    override func registerButtonDidPress() {
        user.firstName = newUserView.firstName()
        user.lastName = newUserView.lastName()
        
        if let validationError = NewUserValidator.validateNewUser(user) {
            let alertController = UIAlertController(title: validationError.localizedDescription, message: validationError.localizedFailureReason, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("NewShiftAllert_loc004", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        } else {
            UserManager.sharedInstance.saveUser(user: user)
            sendNotification()
            navigationController?.popViewController(animated:true)
        }
    }
}
