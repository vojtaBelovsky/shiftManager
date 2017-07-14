//
//  SettingsTableViewCell.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 13/07/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

let settingsTableViewCellReuseIdentifier = "settingsTableViewCellReuseIdentifier"

class SettingsTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        backgroundColor = .red
        
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

extension SettingsTableViewCell {
    func setupCell(viewModel: SettingsCellViewModel) {
        titleLabel.text = viewModel.title
//        backgroundColor = viewModel.color
    }
}

struct SettingsCellViewModel {
    let title: String
//    let color: UIColor
}
