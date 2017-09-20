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
    fileprivate let contentHolder = UIView()
    
    public let viewHeight: CGFloat = 55.0
    public let buttonSize: CGFloat = 30.0
    
    init() {
        super.init(frame: .zero)
        
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        addSubview(contentHolder)
        contentHolder.addSubview(backButton)
        contentHolder.addSubview(actionButton)
        
        titleLabel.textAlignment = .center
        titleLabel.font = titleLabel.font.withSize(17)
        contentHolder.addSubview(titleLabel)
    }
    
    fileprivate func setupConstraints() {
        contentHolder.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        contentHolder.autoSetDimension(.height, toSize: viewHeight)
        
        backButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Insets.navBarInset)
        backButton.autoPinEdge(.trailing, to: .leading, of: titleLabel)
        backButton.autoSetDimensions(to: CGSize(width: buttonSize, height: buttonSize))
        backButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: Insets.navBarInset)
        
        titleLabel.autoAlignAxis(.horizontal, toSameAxisOf: backButton)
        
        actionButton.autoPinEdge(.leading, to: .trailing, of: titleLabel)
        actionButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Insets.navBarInset)
        actionButton.autoSetDimensions(to: CGSize(width: buttonSize, height: buttonSize))
        actionButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: Insets.navBarInset)
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
