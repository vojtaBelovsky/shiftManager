//
//  ExtraShiftTableViewCell.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class ShiftTableViewCell: UITableViewCell {

    let titleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.textColor = .black
        addSubview(titleLabel)
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        titleLabel.autoCenterInSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShiftTableViewCell {
    func extraShiftCell(viewModel: ShiftViewModel) {
        titleLabel.text = viewModel.title
    }
}