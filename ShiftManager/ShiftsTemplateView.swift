//
//  ShiftsTemplateView.swift
//  ShiftManager
//
//  Created by Jiří Tomis on 09.10.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class ShiftsTemplateView: UIView {
    
    let navigationBar = NavigationBar()
    let labelA = UILabel()
    let labelB = UILabel()
    let labelC = UILabel()
    let labelD = UILabel()
    fileprivate let labelHeight: CGFloat = 44.0
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
        navigationBar.setBackImage(#imageLiteral(resourceName: "backIcon"))
        navigationBar.setTitle("Vyberte směnu")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        addSubview(navigationBar)
        
        labelA.textAlignment = .center
        addSubview(labelA)
        labelB.textAlignment = .center
        addSubview(labelB)
        labelC.textAlignment = .center
        addSubview(labelC)
        labelD.textAlignment = .center
        addSubview(labelD)
    }
    
    fileprivate func setupConstraints() {
        navigationBar.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        navigationBar.autoSetDimension(.height, toSize: navigationBar.viewHeight)
        
        labelA.autoPinEdge(.top, to: .bottom, of: navigationBar, withOffset: Spacing.VerticalSpacing)
        labelA.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        labelA.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        labelA.autoSetDimension(.height, toSize: labelHeight)
        
        labelB.autoPinEdge(.top, to: .bottom, of: labelA, withOffset: Spacing.VerticalSpacing)
        labelB.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        labelB.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        labelB.autoSetDimension(.height, toSize: labelHeight)
        
        labelC.autoPinEdge(.top, to: .bottom, of: labelB, withOffset: Spacing.VerticalSpacing)
        labelC.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        labelC.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        labelC.autoSetDimension(.height, toSize: labelHeight)
        
        labelD.autoPinEdge(.top, to: .bottom, of: labelC, withOffset: Spacing.VerticalSpacing)
        labelD.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        labelD.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        labelD.autoSetDimension(.height, toSize: labelHeight)
    }
}
