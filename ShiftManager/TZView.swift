//
//  TZView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 20.09.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

class TZView: UIView {
    
    public let secondDiaologStackView = UIStackView()
    fileprivate let questionlabel = UILabel()
    fileprivate let yesButton = UIButton()
    fileprivate let noButton = UIButton()
    
    public let firstDialogStackView = UIStackView()
    fileprivate let selectShiftLabel = UILabel()
    public let segmentControl = UISegmentedControl (items: ["Směna A", "Směna B", "Směna C", "Směna D"])
    fileprivate let OKButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .clear
        
        
        //stackView.backgroundColor = .white
        firstDialogStackView.isHidden = true
        firstDialogStackView.axis = .vertical
        firstDialogStackView.distribution = .equalCentering
        firstAddSubviewToStackView()
        addSubview(firstDialogStackView)
        
        secondDiaologStackView.isHidden = false
        secondDiaologStackView.axis = .vertical
        secondDiaologStackView.distribution = .equalCentering
        secondAddSubviewToStackView()
        addSubview(secondDiaologStackView)
        
        
        questionlabel.text = NSLocalizedString("TZquestionLabel_001", comment: "")
        questionlabel.textAlignment = .center
        
        yesButton.setTitle(NSLocalizedString("TZyesButton_loc001", comment: ""), for: .normal)
        yesButton.backgroundColor = Colors.papaya
        
        noButton.setTitle(NSLocalizedString("TZnoButton_loc001", comment: ""), for: .normal)
        noButton.backgroundColor = .red
        
        
        
        selectShiftLabel.text = NSLocalizedString("TZquestionLabel_002", comment: "")
        selectShiftLabel.textAlignment = .center
        
        segmentControl.selectedSegmentIndex = 0
        
        segmentControl.tintColor = UIColor.blue
        segmentControl.backgroundColor = textFields.textFieldColorWithAlpha

        OKButton.setTitle("OK", for: .normal)
        OKButton.backgroundColor = Colors.papaya
        
        }
    
    fileprivate func firstAddSubviewToStackView() {
        [getSpaceView(),getSpaceView(),selectShiftLabel, getSpaceView(), segmentControl, getSpaceView(),getSpaceView(), OKButton].forEach { subview in
                firstDialogStackView.addArrangedSubview(subview)
        }
    }
    
    fileprivate func secondAddSubviewToStackView() {
        [getSpaceView(),getSpaceView(), questionlabel, getSpaceView(), getSpaceView(), yesButton, getSpaceView(),getSpaceView(), noButton].forEach { subview in
            secondDiaologStackView.addArrangedSubview(subview)
        }
    }
    
    func setupConstraints(){
        
        secondDiaologStackView.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
        secondDiaologStackView.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.DoubleVertialSpacing)
        secondDiaologStackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.DoubleVertialSpacing)
        
        firstDialogStackView.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
        firstDialogStackView.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.DoubleVertialSpacing)
        firstDialogStackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.DoubleVertialSpacing)

    }
    
    fileprivate func getSpaceView() -> UIView {
        let spaceView = UIView()
        spaceView.autoSetDimension(.height, toSize: 5)
        
        return spaceView
    }
}

extension TZView {
    
    public func yesButtonDidPress(_ target: Any?, action: Selector) {
        yesButton.addTarget(target, action: action, for: .touchUpInside)
    }
    public func noButtonDidPress(_ target: Any?, action: Selector) {
        noButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func okButtonDidPress(_ target: Any?, action: Selector) {
        OKButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func chengeValue(_ target: Any?, action: Selector) {
        segmentControl.addTarget(target, action: action, for: .valueChanged)
    }
    
}
