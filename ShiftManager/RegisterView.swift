//
//  RegisterView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 24.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout



class RegisterView: UIView {

    public var selectImage = UIImageView()
    public var cameraButton = UIButton()
    public var firstNameTextField = UITextField()
    public var lastNameTextField = UITextField()
     var registerButton = UIButton()

    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
      
    }
     func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .white
        
        selectImage.layer.borderWidth = 4
        selectImage.layer.borderColor = UIColor.black.cgColor
        selectImage.layer.cornerRadius = 75.0
        selectImage.layer.masksToBounds = true
        addSubview(selectImage)
        
        firstNameTextField.layer.borderColor = UIColor.black.cgColor
        firstNameTextField.layer.borderWidth = 1
        firstNameTextField.placeholder = NSLocalizedString("RegisterPlaceholder_loc001", comment: "")
        addSubview(firstNameTextField)
        
        lastNameTextField.layer.borderColor = UIColor.black.cgColor
        lastNameTextField.layer.borderWidth = 1
        lastNameTextField.placeholder = NSLocalizedString("RegisterPlaceholder_loc002", comment: "")
        addSubview(lastNameTextField)
       
        registerButton.backgroundColor = .red
        registerButton.setTitle(NSLocalizedString("RegisterButton_loc003", comment: ""), for: .normal)
        addSubview(registerButton)
        
        cameraButton.backgroundColor = .red
        cameraButton.setTitle(NSLocalizedString("RegisterButton_loc004", comment: ""), for: .normal)
        addSubview(cameraButton)
    }
    
    fileprivate func setupConstraints() {
        
        selectImage.autoPinEdge(toSuperviewEdge: .leading, withInset: 130)
        selectImage.autoPinEdge(toSuperviewEdge: .trailing, withInset: 130)
        selectImage.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.4)
        selectImage.autoMatch(.height, to: .height, of: self, withMultiplier: 0.2)
        
        cameraButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 130)
        cameraButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 130)
        cameraButton.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.68)
        cameraButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        firstNameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        firstNameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        firstNameTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.9)
        firstNameTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        lastNameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        lastNameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        lastNameTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.1)
        lastNameTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
       
        registerButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        registerButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        registerButton.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.4)
        registerButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public func registerButtonDidPress(_ target: Any?, action: Selector) {
        registerButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func cameraButtonDidPress(_ target: Any?, action: Selector) {
        cameraButton.addTarget(target, action: action, for: .touchUpInside)
    }
    

    public func firstName() -> String {
        return self.firstNameTextField.text ?? ""
    }
    
    public func lastName() -> String {
        return self.lastNameTextField.text ?? ""
    }
}