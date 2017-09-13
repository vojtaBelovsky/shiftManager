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
    fileprivate let userDefaultIcon = #imageLiteral(resourceName: "defaultIcon")
    
    let userPhotoSize: CGFloat = 50.0
    
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
        
        backgroundColor = .clear
        
        userPhotoImageView.layer.borderWidth = 2
        userPhotoImageView.layer.borderColor = UIColor.clear.cgColor
        userPhotoImageView.layer.cornerRadius = userPhotoSize/2.0
        userPhotoImageView.layer.masksToBounds = true
        userPhotoImageView.image = userDefaultIcon
        userPhotoImageView.isUserInteractionEnabled = false
        addSubview(userPhotoImageView)
        
        userFirstNameLabel.textColor = .black
        userFirstNameLabel.font = .systemFont(ofSize: 20)
        userFirstNameLabel.isUserInteractionEnabled = false
        userFirstNameLabel.numberOfLines = 2
        addSubview(userFirstNameLabel)
        
        userLastNameLabel.textColor = .black
        userLastNameLabel.font = .systemFont(ofSize: 20)
        userLastNameLabel.isUserInteractionEnabled = false
        userLastNameLabel.numberOfLines = 2
        addSubview(userLastNameLabel)
    }
    
    fileprivate func setupConstraints() {
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        userPhotoImageView.autoSetDimensions(to: CGSize(width: userPhotoSize, height: userPhotoSize))
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        
        userFirstNameLabel.autoPinEdge(.top, to: .top, of: userPhotoImageView,withOffset: 14)
        userFirstNameLabel.autoPinEdge(.leading, to: .trailing, of: userPhotoImageView,withOffset: 8)
        userFirstNameLabel.setContentHuggingPriority(501, for: .horizontal)
        
        userLastNameLabel.autoPinEdge(.top, to: .top, of: userPhotoImageView, withOffset: 14)
        userLastNameLabel.autoPinEdge(.leading, to: .trailing, of: userFirstNameLabel, withOffset: 8)
        userLastNameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
    }
}
    
extension UserView {
    public func reloadData() {
        userPhotoImageView.image = UserManager.sharedInstance.selectedUser?.userPhotoImage ?? userDefaultIcon
        userFirstNameLabel.text = UserManager.sharedInstance.selectedUser?.firstName
        userLastNameLabel.text = UserManager.sharedInstance.selectedUser?.lastName
    }
}
