//
//  CalendarEmtpyCollectionViewCell.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import AFDateHelper

let calendarCollectionViewCellEmptyCellCount = "calendarCollectionViewCellEmptyCellIdentifier"

class CalendarEmtpyCollectionViewCell: UICollectionViewCell {
    
    let cellView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        emptyCell()
        addSubviews()
        setupConstraints()
    }
    
    func emptyCell()  {
        cellView.backgroundColor = .white
    }
    
    func addSubviews() {
        contentView.addSubview(cellView)
    }
    
    func setupConstraints() {
        cellView.autoPinEdgesToSuperviewEdges()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   }
