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
    
    override var isSelected: Bool {
        didSet {
            photoImageView.layer.borderColor = isSelected ? UIColor.green.cgColor : UIColor.black.cgColor
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
        
        photoImageView.layer.borderWidth = 2
        photoImageView.layer.borderColor = UIColor.black.cgColor
        photoImageView.layer.cornerRadius = 100.0
        photoImageView.layer.masksToBounds = true
        
    }
    
    fileprivate func addSubviews() {
        contentView.addSubview(photoImageView)
    }

    fileprivate func setupConstraints() {
        photoImageView.autoMatch(.height, to: .height, of: self, withMultiplier: 1.0)
        photoImageView.autoMatch(.width, to: .height, of: photoImageView)
        photoImageView.autoCenterInSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.layer.cornerRadius = contentView.bounds.size.height/4;
    }
    
    func set(image: UIImage?) {
        photoImageView.image = image
    }
    
}
