//
//  TemplatesTableViewCell.swift
//  ShiftManager
//
//  Created by Jiří Tomis on 06.10.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class TemplatesTableViewCell: UITableViewCell {
    
    fileprivate let titleLabel = UILabel()
    fileprivate let separatorLine = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = .clear
        
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        
        separatorLine.backgroundColor = UIColor.lightGray
        addSubview(separatorLine)
    }
    
    fileprivate func setupConstraints() {
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: Spacing.VerticalSpacing)
        titleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        titleLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        separatorLine.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: Spacing.VerticalSpacing)
        separatorLine.autoSetDimension(.height, toSize: 1)
        separatorLine.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
}

extension TemplatesTableViewCell {
    func setTitle() {
        titleLabel.text = "Test"
    }
}
