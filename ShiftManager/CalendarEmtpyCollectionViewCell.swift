//
//  CalendarEmtpyCollectionViewCell.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class CalendarEmtpyCollectionViewCell: UICollectionViewCell {
    
    fileprivate let cellView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        emptyCell()
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func emptyCell()  {
        cellView.backgroundColor = .white
    }
    
    fileprivate func addSubviews() {
        contentView.addSubview(cellView)
    }
    
    fileprivate func setupConstraints() {
        cellView.autoPinEdgesToSuperviewEdges()
    }
    
    
}
