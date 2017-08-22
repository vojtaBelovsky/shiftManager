//
//  RegisterView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 24.07.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout

final class NewUserView: UIView {
    
    fileprivate let selectImageViewContainer = UIView()
    fileprivate let selectImageView = UIImageView()
    let registerButton = UIButton()
    fileprivate let cameraButton = UIButton()
    fileprivate let contactsButton = UIButton()
    fileprivate let firstNameTextField = BoundedTextField()
    fileprivate let lastNameTextField = BoundedTextField()
    fileprivate let stackView = UIStackView()
    
    let profileImgSize: CGFloat = 100.0
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .white
        
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        addSubviewToStackView()
        addSubview(stackView)
        
        selectImageView.layer.borderWidth = 4
        selectImageView.layer.borderColor = UIColor.black.cgColor
        selectImageView.layer.cornerRadius = profileImgSize / 2
        selectImageView.clipsToBounds = true
        selectImageView.layer.masksToBounds = true
        selectImageView.isUserInteractionEnabled = true
        
        firstNameTextField.placeholder = NSLocalizedString("RegisterPlaceholder_loc001", comment: "")
        
        lastNameTextField.placeholder = NSLocalizedString("RegisterPlaceholder_loc002", comment: "")
        
        registerButton.backgroundColor = .red
        registerButton.setTitle(NSLocalizedString("RegisterButton_loc003", comment: ""), for: .normal)
        
        cameraButton.backgroundColor = .red
        cameraButton.setTitle(NSLocalizedString("RegisterButton_loc004", comment: ""), for: .normal)
        
        contactsButton.backgroundColor = .red
        contactsButton.setTitle(NSLocalizedString("RegisterButton_loc006", comment: ""), for: .normal)
    }
    
    fileprivate func addSubviewToStackView() {
        selectImageViewContainer.addSubview(selectImageView)
        [
            selectImageViewContainer, getSpaceView(), cameraButton, firstNameTextField, lastNameTextField, getSpaceView(), registerButton, contactsButton
        ].forEach { subview in
            stackView.addArrangedSubview(subview)
        }
    }
    
    func setupConstraints() {
        
        stackView.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        stackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        stackView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        
        selectImageView.autoSetDimension(.width, toSize: profileImgSize)
        selectImageView.autoSetDimension(.height, toSize: profileImgSize)
        selectImageView.autoPinEdge(toSuperviewEdge: .top)
        selectImageView.autoPinEdge(toSuperviewEdge: .bottom)
        selectImageView.autoAlignAxis(toSuperviewAxis: .vertical)
    }
    
    fileprivate func getSpaceView() -> UIView {
        let spaceView = UIView()
        spaceView.autoSetDimension(.height, toSize: 5)
        
        return spaceView
    }
}

extension NewUserView {
    public func registerButtonDidPress(_ target: Any?, action: Selector) {
        registerButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func cameraButtonDidPress(_ target: Any?, action: Selector) {
        cameraButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func contactsButtonDidPress(_ target: Any?, action: Selector) {
        contactsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func addGestureRecognizerToSelectedImageView(_ gestureRecognizer: UITapGestureRecognizer) {
        selectImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    public func firstName() -> String {
        return firstNameTextField.text ?? ""
    }
    
    public func lastName() -> String {
        return lastNameTextField.text ?? ""
    }
    
    public func userPhoto() -> UIImage? {
        return selectImageView.image
    }
    
    public func setName(contactLastName: String, contactFirstName: String) {
        firstNameTextField.text = contactFirstName
        lastNameTextField.text = contactLastName
    }
    
    public func editUserSetupView(with user: UserModel) {
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
        selectImageView.image = user.userPhotoImage
    }
    
    public func setImage(_ image: UIImage) {
        selectImageView.image = image
    }
}
