//
//  UserView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 14.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

final class UserView: UIButton {
    
    fileprivate let userPhotoImageView = UIImageView()
    fileprivate let userFirstNameLabel = UILabel()
    fileprivate let userLastNameLabel = UILabel()
    
    init() {
        super.init(frame: .zero)

        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
        reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .white
        userPhotoImageView.layer.borderWidth = 2
        userPhotoImageView.layer.borderColor = UIColor.black.cgColor
        userPhotoImageView.layer.cornerRadius = 50.0
        userPhotoImageView.layer.masksToBounds = true
        userPhotoImageView.isUserInteractionEnabled = false
        addSubview(userPhotoImageView)
        
        userFirstNameLabel.textColor = .black
        userFirstNameLabel.backgroundColor = .red
        userFirstNameLabel.isUserInteractionEnabled = false
        userFirstNameLabel.numberOfLines = 2
        addSubview(userFirstNameLabel)
        
        userLastNameLabel.textColor = .black
        userLastNameLabel.backgroundColor = .red
        userLastNameLabel.isUserInteractionEnabled = false
        userLastNameLabel.numberOfLines = 2
        addSubview(userLastNameLabel)
    }

    fileprivate func setupConstraints() {
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 74)
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        userPhotoImageView.autoSetDimensions(to: CGSize(width: 100, height: 100))
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        
        userFirstNameLabel.autoPinEdge(.top, to: .top, of: userPhotoImageView)
        userFirstNameLabel.autoPinEdge(.leading, to: .trailing, of: userPhotoImageView, withOffset: 10)
        userFirstNameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        userLastNameLabel.autoPinEdge(.top, to: .bottom, of: userFirstNameLabel, withOffset: Spacing.VerticalSpacing/2)
        userLastNameLabel.autoPinEdge(.leading, to: .trailing, of: userPhotoImageView, withOffset: 10)
        userLastNameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)

    }
}
    
extension UserView {
    public func reloadData() {
        userPhotoImageView.image = UserManager.sharedInstance.selectedUser?.userPhotoImage
        userFirstNameLabel.text = UserManager.sharedInstance.selectedUser?.firstName
        userLastNameLabel.text = UserManager.sharedInstance.selectedUser?.lastName
    }
}
