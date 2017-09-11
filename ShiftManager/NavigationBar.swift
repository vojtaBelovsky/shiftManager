//
//  NavigationBar.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 06.09.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class NavigationBar: UIView {

        fileprivate let backButton = NavigationButton()
        fileprivate let actionButton = NavigationButton()
        fileprivate let titleLabel = UILabel()
        fileprivate let offSetView = UIView()
    
    init() {
        super.init(frame: .zero)
        
        initializeViewsAndAddThemAsSubviews()
       setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        offSetView.backgroundColor = .clear
        addSubview(offSetView)
        
        backButton.setImage( UIImage.init(named: "backIcon.png"), for: .normal)
       // backButton.backgroundColor = .red
        addSubview(backButton)
        
       // actionButton.backgroundColor = .red
        addSubview(actionButton)
        
        titleLabel.backgroundColor = .clear
        titleLabel.textAlignment = .center
        titleLabel.font = titleLabel.font.withSize(17)
        addSubview(titleLabel)

    }
    
    fileprivate func setupConstraints(){
        backgroundColor = .clear
        
        offSetView.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        offSetView.autoPinEdge(toSuperviewEdge: .trailing)
        offSetView.autoPinEdge(toSuperviewEdge: .leading)
        offSetView.autoSetDimensions(to: CGSize(width: 1, height: 1))
      
        backButton.autoPinEdge(toSuperviewEdge: .leading)
        backButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 5)
        backButton.autoPinEdge(.top, to: .bottom, of: offSetView, withOffset: 1)
        backButton.autoPinEdge(.trailing, to: .leading, of: titleLabel, withOffset: 1)
        backButton.autoSetDimensions(to: CGSize(width: 28, height: 28))
        
        titleLabel.autoPinEdge(.top, to: .bottom, of: offSetView, withOffset: 1)
        titleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 5)
        
        actionButton.autoPinEdge(.top, to: .bottom, of: offSetView, withOffset: 1)
        actionButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 5)
        actionButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 5)
       // .autoPinEdge(.top, to: .bottom, of: offSetView, withOffset: 1)
        actionButton.autoPinEdge(.leading, to: .trailing, of: titleLabel, withOffset: 1)
        actionButton.autoSetDimensions(to: CGSize(width: 28, height: 28))
    }
    
}

extension NavigationBar {
    
    public func setImage(_ image: UIImage) {
        actionButton.setImage(image, for: .normal)
    }
    
    public func setTitle(_ title: String){
        titleLabel.text = "\(title)"
    }
    
    public func backButtonSetAction(_ target: Any?, action: Selector) {
        backButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func actionButtonSetAction(_ target: Any?, action: Selector) {
        actionButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
}
