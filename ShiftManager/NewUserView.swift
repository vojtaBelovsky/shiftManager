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
    
    fileprivate let selectIVCContainer = UIView()
    fileprivate let selectImageViewContainer = UIView()
    fileprivate var selectImageView = UIImageView()
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
        
        selectImageViewContainer.layer.borderWidth = 4
        selectImageViewContainer.layer.borderColor = UIColor.black.cgColor
        selectImageViewContainer.layer.cornerRadius = profileImgSize / 2
        selectImageViewContainer.clipsToBounds = true
        selectImageViewContainer.isUserInteractionEnabled = true

        selectImageView.image = userPlaceholderImage
        
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
        selectIVCContainer.addSubview(selectImageViewContainer)
        selectImageViewContainer.addSubview(selectImageView)
        [
            getSpaceView(), selectIVCContainer, getSpaceView(), firstNameTextField, lastNameTextField,contactsButton, createButton
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
        
        selectImageViewContainer.autoSetDimensions(to: CGSize(width: profileImgSize, height: profileImgSize))
        selectImageViewContainer.autoPinEdge(.top, to: .top, of: selectIVCContainer)
        selectImageViewContainer.autoPinEdge(.bottom, to: .bottom, of: selectIVCContainer)
        selectImageViewContainer.autoAlignAxis(toSuperviewAxis: .vertical)
        
        selectImageView.autoCenterInSuperview()
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
    
    public func addGestureRecognizerToSelectedImageView(_ gestureRecognizer: UITapGestureRecognizer) {
        selectImageViewContainer.addGestureRecognizer(gestureRecognizer)
    }
    
    public func firstName() -> String {
        return firstNameTextField.text ?? ""
    }
    
    public func lastName() -> String {
        return lastNameTextField.text ?? ""
    }
    
    public func userPhoto() -> UIImage? {
        if selectImageView.image == userPlaceholderImage {
            return nil
        }
        return selectImageView.image
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
        selectImageView.image = image
        selectImageView.contentMode = UIViewContentMode.scaleAspectFill
    }
    
    func clearSelectedImage() {
        selectImageView.image = userPlaceholderImage
    }
}
