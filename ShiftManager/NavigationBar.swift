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
        
        addSubview(backButton)
        
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
        actionButton.autoPinEdge(.leading, to: .trailing, of: titleLabel, withOffset: 1)
        actionButton.autoSetDimensions(to: CGSize(width: 28, height: 28))
    }
    
}

extension NavigationBar {
    
    public func setImage(_ image: UIImage) {
        actionButton.setImage(image, for: .normal)
    }
    
    public func setBackImage(_ image: UIImage) {
        backButton.setImage(image, for: .normal)
    }
    
    public func setTitle(_ title: String){
        titleLabel.text = "\(title)"
    }
    
    public func setBackButton(_ target: Any?, action: Selector) {
        backButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func setActionButton(_ target: Any?, action: Selector) {
        actionButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
}
