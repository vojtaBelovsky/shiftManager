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

        newUserView.navigationBar.setTitle(NSLocalizedString("RegisterButton_loc005", comment: ""))

        newUserView.navigationBar.setTitle(NSLocalizedString("RegisterTitle_loc002", comment: ""))

        newUserView.navigationBar.setImage(#imageLiteral(resourceName: "saveIcon"))
        newUserView.navigationBar.setBackImage(#imageLiteral(resourceName: "backIcon"))
        navigationController?.isNavigationBarHidden = true
        newUserView.deleteButton.setTitle(NSLocalizedString("RegisterButton_loc005", comment: ""), for: .normal)
        newUserView.deleteButton.backgroundColor = MaterialColors.red
        setupView()
        newUserView.deleteButtonDidPress(self, action: #selector(deleteButtonDidPress))
        newUserView.navigationBar.setActionButton(self, action: #selector(checkmarkButtonDidPress))
    }
    
    fileprivate func setupView() {
        newUserView.editUserSetupView(with: user)
    }
    
    func deleteButtonDidPress(){
        
        let refreshAlert = UIAlertController(title: NSLocalizedString("DeleteUserAlertController_loc001", comment: ""), message: NSLocalizedString("DeleteUserAlertController_loc002", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("DeleteUserAlertController_loc003", comment: ""), style: .destructive, handler: { (action: UIAlertAction!) in
            UserManager.sharedInstance.deleteSelectedUser()
            self.sendDeleteNotification()
            _ = self.navigationController?.popViewController(animated:true)
        }))
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("DeleteUserAlertController_loc004", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func sendDeleteNotification() {
        let deleteUser = NotificationCenter.default
        deleteUser.post(name: deleteUserNotification, object: nil)
    }
    
    override func sendNotification() {
        let updateUser = NotificationCenter.default
        updateUser.post(name: updateUserNotification, object: nil)
    }
    
    override func checkmarkButtonDidPress() {
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
            _ = navigationController?.popViewController(animated:true)
        }
    }
}
