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
        photoImageView.backgroundColor = .red //TODO: Remove after setting photo, color is just for test
    }
    
    fileprivate func addSubviews() {
        contentView.addSubview(photoImageView)
    }

    fileprivate func setupConstraints() {
        photoImageView.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        photoImageView.autoMatch(.width, to: .height, of: photoImageView)
        photoImageView.autoCenterInSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.layer.cornerRadius = contentView.bounds.size.height/4;
    }
}
