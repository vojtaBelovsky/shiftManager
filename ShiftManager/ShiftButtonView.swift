//
//  ShiftButtonView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 30.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class ShiftButtonView: UIView {
    
    fileprivate var shiftButtonA = UIButton()
    fileprivate var shiftButtonB = UIButton()
    fileprivate var shiftButtonC = UIButton()
    fileprivate var shiftButtonD = UIButton()

    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    
    func initializeViewsAndAddThemAsSubviews() {
        shiftButtonA = createButton(color: .magenta, name: "Shift A", selector: #selector(shiftAbuttonAction))
        addSubview(shiftButtonA) // TODO: zkuste přenes do createButton() fce a vyzkoušet zda funguje
        
        shiftButtonB = createButton(color: .cyan, name: "Shift B", selector: #selector(shiftBbuttonAction))
        addSubview(shiftButtonB)
        
        shiftButtonC = createButton(color: .yellow, name: "Shift C", selector: #selector(shiftCbuttonAction))
        addSubview(shiftButtonC)
        
        shiftButtonD = createButton(color: .red, name: "Shift D", selector: #selector(shiftDbuttonAction))
        addSubview(shiftButtonD)
    }
    
    fileprivate func createButton(color: UIColor, name: String, selector: Selector) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.setTitle(name, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        return button
    }
    
    fileprivate func setupConstraints() {
        shiftButtonA.autoPinEdge(toSuperviewEdge: .top)
        shiftButtonA.autoPinEdge(toSuperviewEdge: .leading)
        
        shiftButtonB.autoPinEdge(toSuperviewEdge: .trailing)
        shiftButtonB.autoPinEdge(toSuperviewEdge: .top)
        
        shiftButtonC.autoPinEdge(toSuperviewEdge: .leading)
        shiftButtonC.autoPinEdge(toSuperviewEdge: .bottom)
        
        shiftButtonD.autoPinEdge(toSuperviewEdge: .bottom)
        shiftButtonD.autoPinEdge(toSuperviewEdge: .trailing)
        
       [shiftButtonA, shiftButtonB, shiftButtonC, shiftButtonD].forEach { button in
            button.autoMatch(.width, to: .width, of: self, withMultiplier: 0.5)
            button.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        }
    }
    
    func shiftAbuttonAction(sender: UIButton!) {
        print("Button Shift A - tapped")
    }

    func shiftBbuttonAction(sender: UIButton!) {
        print("Button Shift B - tapped")
    }

    func shiftCbuttonAction(sender: UIButton!) {
        print("Button Shift C - tapped")
    }

    func shiftDbuttonAction(sender: UIButton!) {
        print("Button Shift D - tapped")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
