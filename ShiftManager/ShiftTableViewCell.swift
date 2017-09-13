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
    fileprivate let colourCircleLabel = CalendarCircleLabel()
    fileprivate let separatorLine = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        
        addSubview(colourCircleLabel)
        separatorLine.backgroundColor = .black
        addSubview(separatorLine)
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        colourCircleLabel.autoSetDimensions(to: CGSize(width: 25.0, height: 25.0))
        colourCircleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: Spacing.VerticalSpacing)
        colourCircleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        colourCircleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: Spacing.VerticalSpacing, relation: .greaterThanOrEqual)

        titleLabel.autoPinEdge(.top, to: .top, of: colourCircleLabel)
        titleLabel.autoPinEdge(.leading, to: .trailing, of: colourCircleLabel, withOffset: Spacing.HorizontalSpacing)
        titleLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        titleLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: Spacing.VerticalSpacing)
        
        separatorLine.autoSetDimension(.height, toSize: 1)
        separatorLine.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ShiftTableViewCell {
    func setup(with viewModel: ShiftViewModel) {
        titleLabel.text = viewModel.title
    }
    
    func setup(with shiftModel: ShiftModel?) {
        colourCircleLabel.setup(with: shiftModel)
    }
}
