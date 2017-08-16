//
//  RegisterViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 24.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
protocol NewUserViewControllerDelegate {
    func newUserViewController(_ controller: NewUserViewController, didRegisterUser: UserModel)
}

let newUserDidRegisterNotification = Notification.Name(rawValue:"newUserDidRegisterNotification")

class NewUserViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let newUserView = NewUserView()
    let userView = UserView()
    var delegate: NewUserViewControllerDelegate?

    override func loadView() {
        self.view = newUserView
        title = NSLocalizedString("RegisterTitle_loc001", comment: "")
        self.newUserView.registerButtonDidPress(self, action: #selector(registerButtonDidPress))
        self.newUserView.cameraButtonDidPress(self, action: #selector(cameraButtonDidPress))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(NewUserViewController.tapDetected))
        singleTap.numberOfTapsRequired = 1
        newUserView.selectImage.isUserInteractionEnabled = true
        newUserView.selectImage.addGestureRecognizer(singleTap)
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
        
        newUserView.selectImage.image = newImage
        
        dismiss(animated: true)
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
    
    func sendNotification() {
        let nc = NotificationCenter.default
        nc.post(name: newUserDidRegisterNotification, object: nil)
    }
    
    func registerButtonDidPress() {
        let user = UserModel()
        user.firstName = newUserView.firstName()
        user.lastName = newUserView.lastName()
        
        if let validationError = NewUserValidator.validateNewUser(user) {
            let alertController = UIAlertController(title: validationError.localizedDescription, message: validationError.localizedFailureReason, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("NewShiftAllert_loc004", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        else {
            UserManager.sharedInstance.saveUser(user: user)
            sendNotification()
            navigationController?.popViewController(animated: true)
        }
    }
    
}
    

