//
//  SignUpView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 24.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

public let horizontalSpacing: CGFloat = 16

class SignUpView: UIView {

    fileprivate var firstNameTextField = UITextField()
    fileprivate var lastNameTextField = UITextField()
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
        firstNameTextField.placeholder = "First name"
        addSubview(firstNameTextField)
        
        lastNameTextField.layer.borderColor = UIColor.black.cgColor
        lastNameTextField.layer.borderWidth = 1
        lastNameTextField.placeholder = "Last name"
        addSubview(lastNameTextField)
        
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.placeholder = "Set password"
        passwordTextField.isSecureTextEntry = true
        addSubview(passwordTextField)
       
        signUpButton.backgroundColor = .red
        signUpButton.setTitle("Sign Up", for: .normal)
        addSubview(signUpButton)
    }
    
    fileprivate func setupConstraints() {
        
        firstNameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: horizontalSpacing)
        firstNameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: horizontalSpacing)
        firstNameTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.4)
        firstNameTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        lastNameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: horizontalSpacing)
        lastNameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: horizontalSpacing)
        lastNameTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.6)
        lastNameTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)

        passwordTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: horizontalSpacing)
        passwordTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: horizontalSpacing)
        passwordTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.8)
        passwordTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)

        signUpButton.autoPinEdge(toSuperviewEdge: .leading, withInset: horizontalSpacing)
        signUpButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: horizontalSpacing)
        signUpButton.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.0)
        signUpButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setActionForSignUpButton(_ target: Any?, action: Selector) {
        signUpButton.addTarget(target, action: action, for: .touchUpInside)
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
