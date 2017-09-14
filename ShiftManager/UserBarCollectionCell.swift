//
//  CalendarCollectionViewCell.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 iDevBand. All rights reserved.

import UIKit
import PureLayout

final class UserBarCollectionCell: UICollectionViewCell {
    
    fileprivate let contentHolder = UILabel()
    fileprivate let photoImageView = UIImageView()
    fileprivate let initialsNameLabel = CalendarCircleLabel()
    
    override var isSelected: Bool {
        didSet {
            initialsNameLabel.layer.borderColor = isSelected ? Colors.papaya.cgColor : UIColor.black.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewItems()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViewItems() {
        
        initialsNameLabel.layer.borderWidth = 2
        initialsNameLabel.layer.borderColor = UIColor.black.cgColor
        
        photoImageView.clipsToBounds = true
        
    }
    
    fileprivate func addSubviews() {
        addSubview(contentHolder)
        contentHolder.addSubview(photoImageView)
        contentHolder.addSubview(initialsNameLabel)
    }
    
    fileprivate func setupConstraints() {
        contentHolder.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(2, 2, 2, 2))
        
        initialsNameLabel.autoPinEdgesToSuperviewEdges()
        photoImageView.autoPinEdgesToSuperviewEdges()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.layer.cornerRadius = bounds.size.height/2
    }
    
    func set(with image: UIImage?, initials: String) {
        photoImageView.image = image
        initialsNameLabel.text = image == nil ? initials.uppercased() : nil
    }
}
