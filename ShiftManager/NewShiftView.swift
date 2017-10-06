//
//  ShiftButtonSettngs.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 12.07.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout

final class NewShiftView: UIView {
    
    let blureEffectView = BlureEffectView()
    let navigationBar = NavigationBar()
    fileprivate let scrollView = UIScrollView()
    fileprivate let contentHolder = UIView()
    public let nameTextField = BoundedTextField()
    let shortcutTextField = BoundedTextField()
    let selectFirstShiftDateLabel = UILabel()
    let datePicker = UIDatePicker()
    let intervalTextField = BoundedTextField()
    let selectShiftColorButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        shiftFirstDate()
        setupConstraints()
        navigationBar.setTitle(NSLocalizedString("CreateNewShift_loc002", comment: ""))
        navigationBar.setImage(#imageLiteral(resourceName: "saveIcon"))
        navigationBar.setBackImage(#imageLiteral(resourceName: "backIcon"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        scrollView.contentInset = UIEdgeInsetsMake(navigationBar.viewHeight + Spacing.VerticalSpacing, 0, 0, 0)
        addSubview(scrollView)
        addSubview(blureEffectView)
        addSubview(navigationBar)
        
        addSubviewToScrollView()
        
        nameTextField.backgroundColor = textFields.textFieldColorWithAlpha
        nameTextField.placeholder = NSLocalizedString("CreateNewShift_loc003", comment: "")
        
        shortcutTextField.placeholder = NSLocalizedString("CreateNewShift_loc008", comment: "")
        shortcutTextField.backgroundColor = textFields.textFieldColorWithAlpha
        
        selectFirstShiftDateLabel.text = NSLocalizedString("CreateNewShift_loc004", comment: "")
        selectFirstShiftDateLabel.backgroundColor = textFields.textFieldColorWithAlpha
        selectFirstShiftDateLabel.textAlignment = .center
        
        datePicker.backgroundColor = textFields.textFieldColorWithAlpha
        
        intervalTextField.placeholder = NSLocalizedString("CreateNewShift_loc006", comment: "")
        intervalTextField.backgroundColor = textFields.textFieldColorWithAlpha
        intervalTextField.keyboardType = UIKeyboardType.numberPad
        
        selectShiftColorButton.backgroundColor = textFields.textFieldColorWithAlpha
        selectShiftColorButton.setTitleColor(.black, for: UIControlState.normal)
    }
    
    fileprivate func addSubviewToScrollView() {
        scrollView.addSubview(contentHolder)
        [nameTextField, shortcutTextField, selectFirstShiftDateLabel, datePicker, intervalTextField, selectShiftColorButton
            ].forEach { subview in
                contentHolder.addSubview(subview)
        }
    }
    
    fileprivate func setupConstraints() {
        blureEffectView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        blureEffectView.autoPinEdge(.bottom, to: .bottom, of: navigationBar)
        
        navigationBar.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        navigationBar.autoSetDimension(.height, toSize: navigationBar.viewHeight)
        
        scrollView.autoPinEdgesToSuperviewEdges()
        
        contentHolder.autoMatch(.width, to: .width, of: self)
        contentHolder.autoPinEdgesToSuperviewEdges()
        
        nameTextField.autoPinEdge(toSuperviewEdge: .top)
        nameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        nameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        shortcutTextField.autoPinEdge(.top, to: .bottom, of: nameTextField, withOffset: Spacing.VerticalSpacing)
        shortcutTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        shortcutTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        selectFirstShiftDateLabel.autoPinEdge(.top, to: .bottom, of: shortcutTextField, withOffset: Spacing.VerticalSpacing)
        selectFirstShiftDateLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        selectFirstShiftDateLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        datePicker.autoPinEdge(.top, to: .bottom, of: selectFirstShiftDateLabel)
        datePicker.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        datePicker.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        datePicker.autoAlignAxis(toSuperviewAxis: .vertical)
        
        intervalTextField.autoPinEdge(.top, to: .bottom, of: datePicker, withOffset: Spacing.VerticalSpacing)
        intervalTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        intervalTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        selectShiftColorButton.autoPinEdge(.top, to: .bottom, of: intervalTextField, withOffset: Spacing.VerticalSpacing)
        selectShiftColorButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        selectShiftColorButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        selectShiftColorButton.autoSetDimension(.height, toSize: 80.0)
        selectShiftColorButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: Spacing.HorizontalSpacing)
    }
    
    fileprivate func shiftFirstDate() {
        datePicker.datePickerMode = .date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
    }
}

extension NewShiftView {
    
    public func renameButton(){
        
        if selectShiftColorButton.backgroundColor == textFields.textFieldColorWithAlpha {
            selectShiftColorButton.setTitle(NSLocalizedString("CreateNewShift_loc007", comment: ""), for: .normal)
        } else{
            selectShiftColorButton.setTitle(NSLocalizedString("CreateNewShift_loc010", comment: ""), for: .normal)
        }
    }
    
    public func setActionForColorButton(_ target: Any?, action: Selector) {
        selectShiftColorButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func name() -> String {
        return self.nameTextField.text ?? ""
    }
    
    public func shortcut() -> String {
        return self.shortcutTextField.text ?? ""
    }
    
    public func interval() -> Int {
        if let textInput = intervalTextField.text, let interval = Int(textInput) {
            return interval
        } else {
            return 0
        }
    }
    
    public func date() -> Date {
        return self.datePicker.date
    }
    
    public func color() -> UIColor? {
        return self.selectShiftColorButton.backgroundColor
    }
    
    public func setupView(with shift: ShiftModel) {
        nameTextField.text = shift.name
        shortcutTextField.text = shift.shortcut
        intervalTextField.text = String(shift.interval)
        selectShiftColorButton.backgroundColor = shift.color
        
        if let date = shift.firstDateOfShift {
            datePicker.date = date
        }
    }
    
    public func setSelectShiftColorButtonBackground(_ color: UIColor?) {
        selectShiftColorButton.backgroundColor = color
        renameButton()
    }
}
