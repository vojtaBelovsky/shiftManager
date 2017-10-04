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
    fileprivate let userNameLabel = UILabel()
    fileprivate let userDefaultIcon = #imageLiteral(resourceName: "defaultIcon")
    fileprivate let topSeparatorLine = UILabel()
    fileprivate let bottomSeparatorLine = UILabel()
    
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
        topSeparatorLine.backgroundColor = UIColor.lightGray
        addSubview(topSeparatorLine)
        
        userPhotoImageView.layer.cornerRadius = userPhotoSize/2.0
        userPhotoImageView.layer.masksToBounds = true
        userPhotoImageView.image = userDefaultIcon
        userPhotoImageView.isUserInteractionEnabled = false
        addSubview(userPhotoImageView)
        
        userNameLabel.font = .systemFont(ofSize: 20)
        userNameLabel.isUserInteractionEnabled = false
        userNameLabel.numberOfLines = 2
        addSubview(userNameLabel)
        
        bottomSeparatorLine.backgroundColor = UIColor.lightGray
        addSubview(bottomSeparatorLine)
    }
    
    fileprivate func setupConstraints() {
        topSeparatorLine.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        topSeparatorLine.autoSetDimension(.height, toSize: 1)
        
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        userPhotoImageView.autoSetDimensions(to: CGSize(width: userPhotoSize, height: userPhotoSize))
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        
        userNameLabel.autoPinEdge(.top, to: .top, of: userPhotoImageView, withOffset: 14)
        userNameLabel.autoPinEdge(.leading, to: .trailing, of: userPhotoImageView, withOffset: 8)
        userNameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        
        bottomSeparatorLine.autoSetDimension(.height, toSize: 1)
        bottomSeparatorLine.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
}

extension UserView {
    public func reloadData() {
        userPhotoImageView.image = UserManager.sharedInstance.selectedUser?.userPhotoImage ?? userDefaultIcon
        if let firstName = UserManager.sharedInstance.selectedUser?.firstName, let lastName = UserManager.sharedInstance.selectedUser?.lastName {
            userNameLabel.text = firstName + " " + lastName
        } else {
            userNameLabel.text = ""
        }
    }
}
