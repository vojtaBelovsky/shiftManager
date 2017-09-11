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
    let createButton = UIButton()
    fileprivate let contactsButton = UIButton()
    let firstNameTextField = BoundedTextField()
    let lastNameTextField = BoundedTextField()
    fileprivate let stackView = UIStackView()
     let navigationBar = NavigationBar()
    
    let profileImgSize: CGFloat = 125.0
    fileprivate let userPlaceholderImage = #imageLiteral(resourceName: "addImageIcon")
    fileprivate let userDefaultImage = #imageLiteral(resourceName: "defaultIcon")
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
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
        
        selectImageView.layer.borderWidth = 4
        
        selectImageView.layer.borderColor = UIColor.black.cgColor
        selectImageView.layer.cornerRadius = profileImgSize / 2
        selectImageView.clipsToBounds = true
        selectImageView.contentMode = .center
        selectImageView.layer.masksToBounds = true
        selectImageView.isUserInteractionEnabled = true
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
        //contactsButton.layer.cornerRadius = 17
       // contactsButton.layer.borderWidth = 1
        contactsButton.setTitle(NSLocalizedString("RegisterButton_loc006", comment: ""), for: .normal)
        
        createButton.backgroundColor = Colors.papaya
        //createButton.layer.cornerRadius = 17
       // createButton.layer.borderWidth = 1
        createButton.setTitle(NSLocalizedString("RegisterButton_loc003", comment: ""), for: .normal)
    }
    
    fileprivate func addSubviewToStackView() {
        selectImageViewContainer.addSubview(selectImageView)
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
        createButton.addTarget(target, action: action, for: .touchUpInside)
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
        if selectImageView.image == userPlaceholderImage {
            selectImageView.image = userDefaultImage
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
    /*
    public func setDeleteButtonVisible(_ visible: Bool) {
        trashButton.isHidden = !visible
    }
 */
}
