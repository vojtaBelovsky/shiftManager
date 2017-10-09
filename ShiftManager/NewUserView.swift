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
    
    let blureEffectView = BlureEffectView()
    let navigationBar = NavigationBar()
    fileprivate let selectImageViewContainer = UIView()
    fileprivate let scrollView = UIScrollView()
    fileprivate let contentHolder = UIView()
    fileprivate let stackView = UIStackView()
    fileprivate var selectImageButton = UIButton()
    let firstNameTextField = BoundedTextField()
    let lastNameTextField = BoundedTextField()
    fileprivate let contactsButton = UIButton()
    let templateButton = UIButton()
    fileprivate let cycleLabel = UILabel()
    let cycleTextField = BoundedTextField()
    let deleteButton = UIButton()
    
    let profileImgSize: CGFloat = 125.0
    fileprivate let userPlaceholderImage = #imageLiteral(resourceName: "addImageIcon")
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
        navigationBar.setBackImage(#imageLiteral(resourceName: "backIcon"))
        navigationBar.setImage(#imageLiteral(resourceName: "saveIcon"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeViewsAndAddThemAsSubviews() {
        scrollView.contentInset = UIEdgeInsetsMake(navigationBar.viewHeight, 0, 0, 0)
        addSubview(scrollView)
        addSubview(blureEffectView)
        addSubview(navigationBar)
        
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        addSubviewToScrollView()
        
        selectImageButton.setImage(userPlaceholderImage, for: .normal)
        selectImageButton.layer.borderWidth = 4
        selectImageButton.layer.borderColor = UIColor.black.cgColor
        selectImageButton.layer.cornerRadius = profileImgSize / 2
        selectImageButton.clipsToBounds = true
        selectImageButton.isUserInteractionEnabled = true
        selectImageButton.contentMode = .scaleAspectFit
        
        firstNameTextField.placeholder = NSLocalizedString("RegisterPlaceholder_loc001", comment: "")
        firstNameTextField.backgroundColor = textFields.textFieldColorWithAlpha
        
        lastNameTextField.placeholder = NSLocalizedString("RegisterPlaceholder_loc002", comment: "")
        lastNameTextField.backgroundColor = textFields.textFieldColorWithAlpha
        
        contactsButton.backgroundColor = Colors.papaya
        contactsButton.setTitle(NSLocalizedString("RegisterButton_loc006", comment: ""), for: .normal)
        
        templateButton.backgroundColor = Colors.papaya
        templateButton.setTitle("Šablony", for: .normal)
        
        cycleLabel.backgroundColor = textFields.textFieldColorWithAlpha
        cycleLabel.text = "Délka cyklu. Jak často se vám opakují vaše pracovní dny. Např. při směnách 2+2+2 je cyklus 8, při práci 5 dní v týdnu R+O+N je cyklus 21. Základní 0 znamená žádné opakování"
        cycleLabel.numberOfLines = 0
        
        cycleTextField.text = "0"
        cycleTextField.backgroundColor = textFields.textFieldColorWithAlpha
        cycleTextField.keyboardType = UIKeyboardType.numberPad
    }
    
    fileprivate func addSubviewToScrollView() {
        selectImageViewContainer.addSubview(selectImageButton)
        scrollView.addSubview(contentHolder)
        contentHolder.addSubview(stackView)
        [
            getSpaceView(), selectImageViewContainer, getSpaceView(), firstNameTextField, lastNameTextField, contactsButton, templateButton, getSpaceView(), cycleLabel, cycleTextField, deleteButton, getSpaceView()
            ].forEach { subview in
                stackView.addArrangedSubview(subview)
        }
    }
    
    func setupConstraints() {
        blureEffectView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        blureEffectView.autoPinEdge(.bottom, to: .bottom, of: navigationBar)
        
        navigationBar.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        navigationBar.autoSetDimension(.height, toSize: navigationBar.viewHeight)
        
        scrollView.autoPinEdgesToSuperviewEdges()
        
        contentHolder.autoMatch(.width, to: .width, of: self)
        contentHolder.autoPinEdgesToSuperviewEdges()
        
        stackView.autoPinEdge(toSuperviewEdge: .top)
        stackView.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        stackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        stackView.autoPinEdge(toSuperviewEdge: .bottom)
        
        selectImageButton.autoPinEdge(.top, to: .top, of: selectImageViewContainer)
        selectImageButton.autoSetDimensions(to: CGSize(width: profileImgSize, height: profileImgSize))
        selectImageButton.autoAlignAxis(toSuperviewAxis: .vertical)
        selectImageButton.autoPinEdge(.bottom, to: .bottom, of: selectImageViewContainer)
    }
    
    fileprivate func getSpaceView() -> UIView {
        let spaceView = UIView()
        spaceView.autoSetDimension(.height, toSize: 5)
        
        return spaceView
    }
}

extension NewUserView {
    
    public func deleteButtonDidPress(_ target: Any?, action: Selector) {
        deleteButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func contactsButtonDidPress(_ target: Any?, action: Selector) {
        contactsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func templateButtonDidPress(_ target: Any?, action: Selector) {
        templateButton.addTarget(target, action: action, for: .touchUpInside)
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
        cycleTextField.text = String(user.cycle)
    }
    
    public func setImage(_ image: UIImage) {
        selectImageButton.setImage(image, for: .normal)
        selectImageButton.contentMode = UIViewContentMode.scaleAspectFill
    }
    
    func clearSelectedImage() {
        selectImageButton.setImage(userPlaceholderImage, for: .normal)
    }
    
    public func cycle() -> Int {
        if let textInput = cycleTextField.text, let cycle = Int(textInput) {
            return cycle
        } else {
            return 0
        }
    }
}
