//
//  NavigationBar.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 06.09.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class NavigationBar: UIView {

        fileprivate let backButton = UIButton()
        fileprivate let actionButton = UIButton()
        fileprivate let titleLabel = UILabel()
    
        fileprivate let editIcon = #imageLiteral(resourceName: "editIcon")
        fileprivate let saveIcon = #imageLiteral(resourceName: "saveIcon")
        fileprivate let doneIcon = #imageLiteral(resourceName: "doneIcon")
        fileprivate let addIcon = #imageLiteral(resourceName: "addButtonIcon")
        fileprivate let trashIcon = #imageLiteral(resourceName: "trashIcon")

    init() {
        super.init(frame: .zero)
        
        initializeViewsAndAddThemAsSubviews()
       setupConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        
        backButton.backgroundColor = .clear
        backButton.setImage( UIImage.init(named: "backIcon.png"), for: .normal)
        addSubview(backButton)
        
        actionButton.backgroundColor = .clear
        addSubview(actionButton)
        
        titleLabel.backgroundColor = .clear
        titleLabel.textAlignment = .center
        addSubview(titleLabel)
        
    }
    
    fileprivate func setupConstraints(){
        backgroundColor = .clear
        
        backButton.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        backButton.autoPinEdge(toSuperviewEdge: .leading)
        backButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 5)
        backButton.autoPinEdge(.trailing, to: .leading, of: titleLabel, withOffset: 1)
        backButton.autoSetDimensions(to: CGSize(width: 70, height: 40))
        
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        titleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 5)
        
        actionButton.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        actionButton.autoPinEdge(toSuperviewEdge: .trailing)
        actionButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: 5)
        actionButton.autoPinEdge(.leading, to: .trailing, of: titleLabel, withOffset: 1)
        actionButton.autoSetDimensions(to: CGSize(width: 70, height: 40))
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
