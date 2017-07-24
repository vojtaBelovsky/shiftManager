//
//  SignUpViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 24.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController{

    let signUpView = SignUpView()

    override func loadView() {
        self.view = signUpView
        title = NSLocalizedString("SignUp_loc006", comment: "")
        
        self.signUpView.setActionForSignUpButton(self, action: #selector(selectSignUpButtonDidPress))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
    
    func selectSignUpButtonDidPress() {
        
        let firstNameString = signUpView.firstName()
        let lastNameString = signUpView.lastName()
        let passwordString = signUpView.password()
        
        if firstNameString.isEmpty {
            let alertController = UIAlertController(title: NSLocalizedString("SignUpAllert_loc001", comment: ""), message: NSLocalizedString("SignUpAllert_loc002", comment: ""), preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("SignUpAllert_loc005", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        if lastNameString.isEmpty {
            let alertController = UIAlertController(title: NSLocalizedString("SignUpAllert_loc001", comment: ""), message: NSLocalizedString("SignUpAllert_loc003", comment: ""), preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("SignUpAllert_loc005", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }

        
        if passwordString.isEmpty {
            let alertController = UIAlertController(title: NSLocalizedString("SignUpAllert_loc001", comment: ""), message: NSLocalizedString("SignUpAllert_loc004", comment: ""), preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("SignUpAllert_loc005", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }

     /*
        else {
            let alertController = UIAlertController(title: "Error", message: "Textfields are badly filled", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    */
    }
    
   
}
