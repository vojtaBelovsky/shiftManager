//
//  RegisterViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 24.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let registerView = RegisterView()

    override func loadView() {
        self.view = registerView
        title = NSLocalizedString("RegisterTitle_loc001", comment: "")
        self.registerView.registerButtonDidPress(self, action: #selector(selectRegisterButtonDidPress))
        self.registerView.cameraButtonDidPress(self, action: #selector(selectCameraButtonDidPress))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.tapDetected))
        singleTap.numberOfTapsRequired = 1 // you can change this value
        registerView.selectImage.isUserInteractionEnabled = true
        registerView.selectImage.addGestureRecognizer(singleTap)
    }
    
    func tapDetected() {
        selectPicture()
    }
        
   func selectPicture() {
        let picker = UIImagePickerController()
      //picker.allowsEditing = true
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
        
        registerView.selectImage.image = newImage
        
        dismiss(animated: true)
    }
    
    func selectCameraButtonDidPress(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func selectRegisterButtonDidPress() {
        let name = RegisterModel()
        name.firstName = registerView.firstName()
        name.lastName = registerView.lastName()
        
        if let validationError = RegisterValidator.validateRegister(name) {
            let alertController = UIAlertController(title: validationError.localizedDescription, message: validationError.localizedFailureReason, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("NewShiftAllert_loc004", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        else {
            navigationController?.popViewController(animated:true)
        }
    }
    
}
    

