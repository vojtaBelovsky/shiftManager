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
    
    fileprivate let nameTextField = BoundedTextField()
    fileprivate let shortcutTextField = BoundedTextField()
    fileprivate let selectFirstShiftDateLabel = UILabel()
    fileprivate let datePicker = UIDatePicker()
    fileprivate let intervalTextField = BoundedTextField()
    fileprivate let selectShiftColorButton = UIButton()
    fileprivate let view = UIView()
    fileprivate let contentHolder = UIView()
    let navigationBar = NavigationBar()
    
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
        nameTextField.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        nameTextField.placeholder = NSLocalizedString("CreateNewShift_loc003", comment: "")
        nameTextField.borderStyle = UITextBorderStyle.none
        nameTextField.layer.borderWidth = 0
        
        shortcutTextField.placeholder = NSLocalizedString("CreateNewShift_loc008", comment: "")
        shortcutTextField.backgroundColor = textFields.textFieldColorWithAlpha
        shortcutTextField.borderStyle = UITextBorderStyle.none
        shortcutTextField.layer.borderWidth = 0
        
        
        selectFirstShiftDateLabel.text = NSLocalizedString("CreateNewShift_loc004", comment: "")
        selectFirstShiftDateLabel.textColor = .black
        selectFirstShiftDateLabel.backgroundColor = textFields.textFieldColorWithAlpha
        selectFirstShiftDateLabel.textAlignment = .center
        
        intervalTextField.placeholder = NSLocalizedString("CreateNewShift_loc006", comment: "")
        intervalTextField.backgroundColor = textFields.textFieldColorWithAlpha
        intervalTextField.keyboardType = UIKeyboardType.numberPad
        intervalTextField.borderStyle = UITextBorderStyle.none
        intervalTextField.layer.borderWidth = 0
        
        selectShiftColorButton.backgroundColor = textFields.textFieldColorWithAlpha
        selectShiftColorButton.layer.borderWidth = 0
        selectShiftColorButton.layer.masksToBounds = true
        selectShiftColorButton.setTitle(NSLocalizedString("CreateNewShift_loc007", comment: ""), for: .normal)
        selectShiftColorButton.setTitleColor(.black, for: UIControlState.normal)

        datePicker.backgroundColor = textFields.textFieldColorWithAlpha
        addSubview(view)
        addSubview(navigationBar)
        addSubviewToView()
    }
    
    fileprivate func addSubviewToView() {
        view.addSubview(contentHolder)

        [nameTextField, shortcutTextField, selectFirstShiftDateLabel, datePicker, intervalTextField, selectShiftColorButton ].forEach { subview in
            contentHolder.addSubview(subview)
        }
    }
    
    fileprivate func setupConstraints() {
        view.autoPinEdgesToSuperviewEdges()
        
        navigationBar.autoPinEdge(.bottom, to: .top, of: nameTextField, withOffset: -10)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        
        contentHolder.autoMatch(.width, to: .width, of: self)
        contentHolder.autoPinEdgesToSuperviewEdges()

        nameTextField.autoPinEdge(.top, to: .bottom, of: navigationBar, withOffset: Spacing.VerticalSpacing)
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
        selectShiftColorButton.autoSetDimension(.height, toSize: 100.0)
    }
    
    fileprivate func shiftFirstDate() {
        datePicker.datePickerMode = .date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
    }
}

extension NewShiftView {

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
        selectShiftColorButton.setTitle("", for: .normal)
    }
}
