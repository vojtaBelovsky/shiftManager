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
        edgesForExtendedLayout = .bottom
        title = NSLocalizedString("RegisterTitle_loc001", comment: "")
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(NewUserViewController.tapDetected))
        singleTap.numberOfTapsRequired = 1
        newUserView.addGestureRecognizerToSelectedImageView(singleTap)
        newUserView.registerButtonDidPress(self, action: #selector(registerButtonDidPress))
        newUserView.cameraButtonDidPress(self, action: #selector(cameraButtonDidPress))
        newUserView.contactsButtonDidPress(self, action: #selector(contactsButtonDidPress))
    }
    
    func tapDetected() {
        selectPicture()
    }
    
    func selectPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func cameraButtonDidPress(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func contactsButtonDidPress(){
        let contactPicker = CNContactPickerViewController()
        contactPicker.delegate = self
        self.present(contactPicker, animated: true, completion: nil)
    }
    
    func sendNotification() {
        let newUserDidRegister = NotificationCenter.default
        newUserDidRegister.post(name: newUserDidRegisterNotification, object: nil)
    }
    
    func registerButtonDidPress() {
        let user = UserModel()
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
