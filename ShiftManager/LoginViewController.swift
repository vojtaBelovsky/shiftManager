//
//  SignUpViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 24.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{
    
    let loginView = LoginView()
    
    override func loadView() {
        self.view = loginView
        title = NSLocalizedString("LoginTitle_loc001", comment: "")
        
        self.loginView.setActionForLoginButton(self, action: #selector(selectLoginButtonDidPress))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func selectLoginButtonDidPress() {
        
        let emailString = loginView.firstName()
        let passwordString = loginView.password()
        
        if emailString.isEmpty {
            let alertController = UIAlertController(title: NSLocalizedString("LoginAllert_loc001", comment: ""), message: NSLocalizedString("LoginAllert_loc002", comment: ""), preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("LoginAllert_loc004", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }

        if passwordString.isEmpty {
            let alertController = UIAlertController(title: NSLocalizedString("LoginAllert_loc001", comment: ""), message: NSLocalizedString("LoginAllert_loc003", comment: ""), preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: NSLocalizedString("LoginAllert_loc004", comment: ""), style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
    }
}
