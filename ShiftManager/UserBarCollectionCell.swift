//
//  CalendarCollectionViewCell.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.

import UIKit
import PureLayout

final class UserBarCollectionCell: UICollectionViewCell {
    
    fileprivate let photoImageView = UIImageView()
    fileprivate let initialsNameLabel = UILabel()
    
    override var isSelected: Bool {
        didSet {
            photoImageView.layer.borderColor = isSelected ? UIColor.green.cgColor : UIColor.black.cgColor
            initialsNameLabel.layer.borderColor = isSelected ? UIColor.green.cgColor : UIColor.black.cgColor
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

        initialsNameLabel.textColor = .black
        initialsNameLabel.layer.borderWidth = 2
        initialsNameLabel.layer.borderColor = UIColor.black.cgColor
        initialsNameLabel.textAlignment = .center
        
        photoImageView.layer.borderWidth = 2
        photoImageView.layer.borderColor = UIColor.black.cgColor
        photoImageView.clipsToBounds = true
        
    }
    
    fileprivate func addSubviews() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(initialsNameLabel)
    }

    fileprivate func setupConstraints() {
        initialsNameLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 1.0)
        initialsNameLabel.autoMatch(.width, to: .height, of: photoImageView)
        initialsNameLabel.autoCenterInSuperview()
        
        photoImageView.autoMatch(.height, to: .height, of: self, withMultiplier: 1.0)
        photoImageView.autoMatch(.width, to: .height, of: photoImageView)
        photoImageView.autoCenterInSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.layer.cornerRadius = contentView.bounds.size.height/2;
        initialsNameLabel.layer.cornerRadius = contentView.bounds.size.height/2;
    }
    
    func set(with image: UIImage?, initials: String) {
        if image != nil {
            photoImageView.image = image
            photoImageView.isHidden = false
            initialsNameLabel.isHidden = true
        } else {
            initialsNameLabel.text = initials
            photoImageView.isHidden = true
            initialsNameLabel.isHidden = false
        }
    }
    
}
