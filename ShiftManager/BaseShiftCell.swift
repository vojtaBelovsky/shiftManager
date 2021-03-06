//
//  ExtraShiftTableViewCell.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout

class BaseShiftCell: UITableViewCell {
    
    fileprivate let titleLabel = UILabel()
    fileprivate let tableView = UITableView()
    fileprivate let colourCircleLabel = CalendarCircleLabel()
    fileprivate let separatorLine = UILabel()
    var leftInset: CGFloat = 0.0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func commonInit() {
        backgroundColor = .clear
        
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        
        addSubview(colourCircleLabel)
        
        separatorLine.backgroundColor = UIColor.lightGray
        addSubview(separatorLine)
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        colourCircleLabel.autoSetDimensions(to: CGSize(width: 25.0, height: 25.0))
        colourCircleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: Spacing.VerticalSpacing)
        colourCircleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: leftInset)
        colourCircleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: Spacing.VerticalSpacing, relation: .greaterThanOrEqual)
        
        titleLabel.autoPinEdge(.top, to: .top, of: colourCircleLabel)
        titleLabel.autoPinEdge(.leading, to: .trailing, of: colourCircleLabel, withOffset: Spacing.HorizontalSpacing)
        titleLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        titleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: Spacing.VerticalSpacing)
        
        separatorLine.autoSetDimension(.height, toSize: 1)
        separatorLine.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
}

extension BaseShiftCell {
    func setup(with shiftModel: ShiftModel?) {
        colourCircleLabel.setup(with: shiftModel)
        titleLabel.text = shiftModel?.name
    }
}
