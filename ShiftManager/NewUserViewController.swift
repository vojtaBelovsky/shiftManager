//
//  RegisterViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 24.07.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import ContactsUI

protocol NewUserViewControllerDelegate {
    func newUserViewController(_ controller: NewUserViewController, didRegisterUser: UserModel)
}

let newUserDidRegisterNotification = Notification.Name(rawValue:"newUserDidRegisterNotification")

class NewUserViewController: UIViewController {
    
    let newUserView = NewUserView()
    var delegate: NewUserViewControllerDelegate?
    
    override func loadView() {
        view = newUserView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bcg")
        self.view.insertSubview(backgroundImage, at: 0)
        edgesForExtendedLayout = .bottom
        
        newUserView.navigationBar.setTitle(NSLocalizedString("RegisterTitle_loc001", comment: ""))
        
        newUserView.navigationBar.setBackButton(self, action: #selector(backButtonDidPress))
        newUserView.navigationBar.setActionButton(self, action: #selector(checkmarkButtonDidPress))
        newUserView.importButtonDidPress(self, action: #selector(importButtonDidPress))
        newUserView.selectImageButtonDidPress(self, action: #selector(selectPicture))
        }
    
    func backButtonDidPress(){
   _ = navigationController?.popViewController(animated: true)
 
    }
    
    func selectPicture() {
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let firstAction: UIAlertAction = UIAlertAction(title: NSLocalizedString("NewShiftAlertController_loc002", comment: ""), style: .default) { action -> Void in
            
            let picker = UIImagePickerController()
            picker.allowsEditing = true
            picker.delegate = self
            self.present(picker, animated: true)
        }
        
        let secondAction: UIAlertAction = UIAlertAction(title: NSLocalizedString("NewShiftAlertController_loc001", comment: ""), style: .default) { action -> Void in
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let clearAction: UIAlertAction = UIAlertAction(title: NSLocalizedString("NewShiftAlertController_loc003", comment: ""), style: .destructive) { action -> Void in
            self.newUserView.clearSelectedImage()
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(secondAction)
        actionSheetController.addAction(clearAction)
        actionSheetController.addAction(cancelAction)
        present(actionSheetController, animated: true, completion: nil)
    }
    
    func importButtonDidPress(){
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        self.present(contactPicker, animated: true, completion: nil)
    }
    
    func sendNotification() {
        let newUserDidRegister = NotificationCenter.default
        newUserDidRegister.post(name: newUserDidRegisterNotification, object: nil)
    }
    
    func checkmarkButtonDidPress() {
        let user = UserModel()
        user.firstName = newUserView.firstName()
        user.lastName = newUserView.lastName()
        user.userPhotoImage = newUserView.userPhoto()
        
        if let validationError = NewUserValidator.validateNewUser(user) {
            if validationError.code == userErrorType.userErrorTypeFirstName.rawValue {
                newUserView.firstNameTextField.backgroundColor = .red
            }
            
            if validationError.code == userErrorType.userErrorTypeLastName.rawValue {
                newUserView.lastNameTextField.backgroundColor = .red
            }
            let alertController = UIAlertController(title: validationError.localizedDescription, message: validationError.localizedFailureReason, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("NewShiftAllert_loc004", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        
        } else {
            UserManager.sharedInstance.saveUser(user: user)
            sendNotification()
            _ = navigationController?.popViewController(animated: true)
        }
    }
}

extension NewUserViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        
        newUserView.setImage(newImage)
        
        dismiss(animated: true)
    }
}

extension NewUserViewController: CNContactPickerDelegate {

     public func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        if let data = contact.imageData, let image = UIImage(data: data) {
            newUserView.setImage(image)
        }
        
        newUserView.setName(contactLastName: contact.familyName, contactFirstName: contact.givenName)
    }
}
