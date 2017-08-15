//
//  UserView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 14.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class UserView: UIButton {

    var user: UserModel? {
        didSet {
            userPhotoImageView.image = user?.userPhoto
            userFirstNameLabel.text = user?.firstName
            userLastNameLabel.text = user?.lastName
        }
    }
    
    let userPhotoImageView = UIImageView()
    let userFirstNameLabel = UILabel()
    let userLastNameLabel = UILabel()
   // let userBar = BarView()
   // let settingsView = SettingsView()
    
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
        userPhotoImageView.layer.borderWidth = 4
        userPhotoImageView.layer.borderColor = UIColor.black.cgColor
        userPhotoImageView.layer.cornerRadius = 75.0
        userPhotoImageView.layer.masksToBounds = true
        userPhotoImageView.isUserInteractionEnabled = false
        addSubview(userPhotoImageView)
        
        userFirstNameLabel.textColor = .black
        userFirstNameLabel.backgroundColor = .red
        userFirstNameLabel.isUserInteractionEnabled = false
        addSubview(userFirstNameLabel)
        
        userLastNameLabel.textColor = .black
        userLastNameLabel.backgroundColor = .red
        userLastNameLabel.isUserInteractionEnabled = false
        addSubview(userLastNameLabel)
    }

    fileprivate func setupConstraints() {
        
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 74)
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        userPhotoImageView.autoSetDimensions(to: CGSize(width: 50, height:50))
        userPhotoImageView.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        
        userFirstNameLabel.autoPinEdge(.top, to: .top, of: userPhotoImageView)
        userFirstNameLabel.autoPinEdge(.leading, to: .trailing, of: userPhotoImageView, withOffset: 10)
        
        userLastNameLabel.autoPinEdge(.top, to: .bottom, of: userFirstNameLabel)
        userLastNameLabel.autoPinEdge(.leading, to: .trailing, of: userPhotoImageView, withOffset: 10)

        }
}
    
