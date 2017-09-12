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
    fileprivate var selectImageView = UIImageView()
    fileprivate var selectImageButton = UIButton()
    let createButton = UIButton()
    fileprivate let contactsButton = UIButton()
    let firstNameTextField = BoundedTextField()
    let lastNameTextField = BoundedTextField()
    fileprivate let stackView = UIStackView()
    let navigationBar = NavigationBar()
    
    let profileImgSize: CGFloat = 125.0
    fileprivate let userPlaceholderImage = #imageLiteral(resourceName: "addImageIcon")
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
        navigationBar.setBackImage(#imageLiteral(resourceName: "backIcon"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .clear
        
        addSubview(navigationBar)
        
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        addSubviewToStackView()
        addSubview(stackView)
        
        selectImageButton.setImage(userPlaceholderImage, for: .normal)
        selectImageButton.layer.borderWidth = 4
        selectImageButton.layer.borderColor = UIColor.black.cgColor
        selectImageButton.layer.cornerRadius = profileImgSize / 2
        selectImageButton.clipsToBounds = true
        selectImageButton.isUserInteractionEnabled = true
        selectImageButton.contentMode = .scaleAspectFit
        
        firstNameTextField.placeholder = NSLocalizedString("RegisterPlaceholder_loc001", comment: "")
        firstNameTextField.backgroundColor = textFields.textFieldColorWithAlpha
        firstNameTextField.borderStyle = UITextBorderStyle.none
        firstNameTextField.layer.borderWidth = 0
       
        lastNameTextField.placeholder = NSLocalizedString("RegisterPlaceholder_loc002", comment: "")
        lastNameTextField.backgroundColor = textFields.textFieldColorWithAlpha
        lastNameTextField.borderStyle = UITextBorderStyle.none
        lastNameTextField.layer.borderWidth = 0
        
        contactsButton.backgroundColor = Colors.papaya
        contactsButton.setTitle(NSLocalizedString("RegisterButton_loc006", comment: ""), for: .normal)
        
        createButton.backgroundColor = Colors.papaya
        createButton.setTitle(NSLocalizedString("RegisterButton_loc003", comment: ""), for: .normal)
    }
    
    fileprivate func addSubviewToStackView() {
        selectImageViewContainer.addSubview(selectImageButton)
        [
            getSpaceView(), selectImageViewContainer, getSpaceView(), firstNameTextField, lastNameTextField,contactsButton, createButton
        ].forEach { subview in
            stackView.addArrangedSubview(subview)
        }
    }
    
    func setupConstraints() {
        navigationBar.autoPinEdge(.bottom, to: .top, of: stackView)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        
        stackView.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        stackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        stackView.autoPinEdge(toSuperviewEdge: .top, withInset: 55)
        
        selectImageButton.autoSetDimensions(to: CGSize(width: profileImgSize, height: profileImgSize))
        selectImageButton.autoAlignAxis(toSuperviewAxis: .vertical)
        selectImageButton.autoPinEdge(.top, to: .top, of: selectImageViewContainer)
        selectImageButton.autoPinEdge(.bottom, to: .bottom, of: selectImageViewContainer)
    }
    
    fileprivate func getSpaceView() -> UIView {
        let spaceView = UIView()
        spaceView.autoSetDimension(.height, toSize: 5)
        
        return spaceView
    }
}

extension NewUserView {
    
    public func registerButtonDidPress(_ target: Any?, action: Selector) {
        createButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func contactsButtonDidPress(_ target: Any?, action: Selector) {
        contactsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func selectImageButtonDidPress(_ target: Any?, action: Selector) {
        selectImageButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func firstName() -> String {
        return firstNameTextField.text ?? ""
    }
    
    public func lastName() -> String {
        return lastNameTextField.text ?? ""
    }
    
    public func userPhoto() -> UIImage? {
        if selectImageButton.image(for: .normal) == userPlaceholderImage {
            return nil
        }
        return selectImageButton.image(for: .normal)
    }
    
    public func setName(contactLastName: String, contactFirstName: String) {
        firstNameTextField.text = contactFirstName
        lastNameTextField.text = contactLastName
    }
    
    public func editUserSetupView(with user: UserModel) {
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
        setImage(user.userPhotoImage ?? userPlaceholderImage)
    }
    
    public func setImage(_ image: UIImage) {
        selectImageButton.setImage(image, for: .normal)
        selectImageButton.contentMode = UIViewContentMode.scaleAspectFill
    }
    
    func clearSelectedImage() {
        selectImageButton.setImage(userPlaceholderImage, for: .normal)
    }
}
