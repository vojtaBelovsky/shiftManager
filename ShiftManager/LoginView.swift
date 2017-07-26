//
//  SignUpView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 24.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class LoginView: UIView {
    
    fileprivate var emailTextField = UITextField()
    fileprivate var passwordTextField = UITextField()
    fileprivate var loginButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .white
        
        emailTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.layer.borderWidth = 1
        emailTextField.keyboardType = .emailAddress
        emailTextField.placeholder = NSLocalizedString("LoginPlaceholder_loc001", comment: "")
        addSubview(emailTextField)
        
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.placeholder = NSLocalizedString("LoginPlaceholder_loc002", comment: "")
        passwordTextField.isSecureTextEntry = true
        addSubview(passwordTextField)
        
        loginButton.backgroundColor = .red
        loginButton.setTitle(NSLocalizedString("LoginButton_loc001", comment: ""), for: .normal)
        addSubview(loginButton)
    }
    
    fileprivate func setupConstraints() {
        
        emailTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        emailTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        emailTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.4)
        emailTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        passwordTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        passwordTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        passwordTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.6)
        passwordTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        loginButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        loginButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        loginButton.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.8)
        loginButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setActionForLoginButton(_ target: Any?, action: Selector) {
        loginButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func firstName() -> String {
        return self.emailTextField.text ?? ""
    }
    
    
    public func password() -> String {
        return self.passwordTextField.text ?? ""
    }
}
