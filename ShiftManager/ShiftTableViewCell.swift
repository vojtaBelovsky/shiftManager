//
//  ExtraShiftTableViewCell.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout

final class ShiftTableViewCell: UITableViewCell {

    fileprivate let titleLabel = UILabel()
    fileprivate let tableView = UITableView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        let inset = CGFloat(40.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: Spacing.VerticalSpacing)
        titleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: inset)
        titleLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: inset)
        titleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: Spacing.VerticalSpacing)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShiftTableViewCell {
    func setup(with viewModel: ShiftViewModel) {
        titleLabel.text = viewModel.title
        //backgroundColor = viewModel.color
        backgroundColor = UIColor.white.withAlphaComponent(0.6)
    }
}
