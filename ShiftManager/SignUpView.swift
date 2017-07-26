//
//  SignUpView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 24.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout



class SignUpView: UIView {

    fileprivate var firstNameTextField = UITextField()
    fileprivate var lastNameTextField = UITextField()
    fileprivate var emailTextField = UITextField()
    fileprivate var passwordTextField = UITextField()
    fileprivate var signUpButton = UIButton()

    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
     func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .white
        
        firstNameTextField.layer.borderColor = UIColor.black.cgColor
        firstNameTextField.layer.borderWidth = 1
        firstNameTextField.placeholder = NSLocalizedString("SignUpPlaceholder_loc007", comment: "")
        addSubview(firstNameTextField)
        
        lastNameTextField.layer.borderColor = UIColor.black.cgColor
        lastNameTextField.layer.borderWidth = 1
        lastNameTextField.placeholder = NSLocalizedString("SignUpPlaceholder_loc008", comment: "")
        addSubview(lastNameTextField)
        
        emailTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.keyboardType = .emailAddress
        emailTextField.placeholder = NSLocalizedString("SignUpPlaceholder_loc010", comment: "")
        addSubview(emailTextField)
        
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.placeholder = NSLocalizedString("SignUpPlaceholder_loc009", comment: "")
        passwordTextField.isSecureTextEntry = true
        addSubview(passwordTextField)
       
        signUpButton.backgroundColor = .red
        signUpButton.setTitle(NSLocalizedString("SignUpButton_loc001", comment: ""), for: .normal)
        addSubview(signUpButton)
    }
    
    fileprivate func setupConstraints() {
        
        firstNameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        firstNameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        firstNameTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.4)
        firstNameTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        lastNameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        lastNameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        lastNameTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.6)
        lastNameTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        emailTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        emailTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        emailTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.8)
        emailTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)

        passwordTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        passwordTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        passwordTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.0)
        passwordTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)

        signUpButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        signUpButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        signUpButton.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.2)
        signUpButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setActionForSignUpButton(_ target: Any?, action: Selector) {
        signUpButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func isValid(_ enteredEmail: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    
    public func firstName() -> String {
        return self.firstNameTextField.text ?? ""
    }
    
    public func lastName() -> String {
        return self.lastNameTextField.text ?? ""
    }
    
    public func password() -> String {
        return self.passwordTextField.text ?? ""
    }
}
