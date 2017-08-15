//
//  UserView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 14.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class UserView: UIView {

    var user: UserModel?
    
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
      //  addSubview(userBar)
        userPhotoImageView.layer.borderWidth = 4
        userPhotoImageView.layer.borderColor = UIColor.black.cgColor
        userPhotoImageView.layer.cornerRadius = 75.0
        userPhotoImageView.layer.masksToBounds = true
        addSubview(userPhotoImageView)
        
        userFirstNameLabel.textColor = .black
        addSubview(userFirstNameLabel)
        
        userLastNameLabel.textColor = .black
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
    
