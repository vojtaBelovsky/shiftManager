//
//  EditUserViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 15.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
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
        title = NSLocalizedString("RegisterTitle_loc002", comment: "")
        newUserView.createButton.setTitle(NSLocalizedString("RegisterButton_loc005", comment: ""), for: .normal)
        setupView()
          newUserView.trashButtonDidPress(self, action: #selector(deleteButtonDidPress))
    }
    
    fileprivate func setupView() {
        newUserView.editUserSetupView(with: user)
        newUserView.setDeleteButtonVisible(true)
    }
    
    func deleteButtonDidPress(){
        UserManager.sharedInstance.deleteSelectedUser()
        sendDeleteNotification()
        navigationController?.isNavigationBarHidden = false
        _ = navigationController?.popViewController(animated:true)
    }
    
    func sendDeleteNotification() {
        let deleteUser = NotificationCenter.default
        deleteUser.post(name: deleteUserNotification, object: nil)
    }
    
    override func sendNotification() {
        let updateUser = NotificationCenter.default
        updateUser.post(name: updateUserNotification, object: nil)
    }
    
    override func registerButtonDidPress() {
        user.firstName = newUserView.firstName()
        user.lastName = newUserView.lastName()
        user.userPhotoImage = newUserView.userPhoto()
        
        if let validationError = NewUserValidator.validateNewUser(user) {
            let alertController = UIAlertController(title: validationError.localizedDescription, message: validationError.localizedFailureReason, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("NewShiftAllert_loc004", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        } else {
            UserManager.sharedInstance.saveUser(user: user)
            sendNotification()
            navigationController?.isNavigationBarHidden = false
            _ = navigationController?.popViewController(animated:true)
        }
    }
}


