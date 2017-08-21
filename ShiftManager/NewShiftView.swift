//
//  ShiftButtonSettngs.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 12.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

final class NewShiftView: UIView {
    
    fileprivate let nameLabel = UILabel()
    fileprivate let nameTextField = UITextField()
    fileprivate let selectFirstShiftDateLabel = UILabel()
    fileprivate let datePicker = UIDatePicker()
    fileprivate let intervalLabel = UILabel()
    fileprivate let intervalTextField = UITextField()
    fileprivate let shortcutTextField = UITextField()
    fileprivate let selectShiftColorButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        shiftFirstDate()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .white
        nameLabel.text = NSLocalizedString("CreateNewShift_loc003", comment: "")
        nameLabel.textColor = .black
        addSubview(nameLabel)
        
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.layer.borderWidth = 1
        addSubview(nameTextField)
        
        shortcutTextField.layer.borderColor = UIColor.black.cgColor
        shortcutTextField.layer.borderWidth = 1
        shortcutTextField.placeholder = NSLocalizedString("CreateNewShift_loc008", comment: "")
        addSubview(shortcutTextField)
        
        selectFirstShiftDateLabel.text = NSLocalizedString("CreateNewShift_loc004", comment: "")
        selectFirstShiftDateLabel.textColor = .black
        addSubview(selectFirstShiftDateLabel)
        
        intervalLabel.text = NSLocalizedString("CreateNewShift_loc005", comment: "")
        intervalLabel.textColor = .black
        addSubview(intervalLabel)
        
        intervalTextField.layer.borderColor = UIColor.black.cgColor
        intervalTextField.layer.borderWidth = 1
        intervalTextField.placeholder = NSLocalizedString("CreateNewShift_loc006", comment: "")
        intervalTextField.keyboardType = UIKeyboardType.numberPad
        addSubview(intervalTextField)
        
        selectShiftColorButton.backgroundColor = .white
        selectShiftColorButton.setTitle(NSLocalizedString("CreateNewShift_loc007", comment: ""), for: .normal)
        selectShiftColorButton.setTitleColor(.black, for: UIControlState.normal)
        selectShiftColorButton.layer.borderColor = UIColor.black.cgColor
        selectShiftColorButton.layer.borderWidth = 1
        addSubview(selectShiftColorButton)
    }
    
    fileprivate func setupConstraints() {
        nameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        nameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        nameLabel.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.1)
        nameLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        
        nameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        nameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        nameTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.2)
        nameTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        shortcutTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        shortcutTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        shortcutTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.35)
        shortcutTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        selectFirstShiftDateLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        selectFirstShiftDateLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        selectFirstShiftDateLabel.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.55)
        selectFirstShiftDateLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.6)
        
        intervalLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        intervalLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        intervalLabel.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.3)
        intervalLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        
        intervalTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        intervalTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        intervalTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.4)
        intervalTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        selectShiftColorButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        selectShiftColorButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        selectShiftColorButton.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.65)
        selectShiftColorButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.1)
    }
    
    fileprivate func shiftFirstDate() {
        datePicker.datePickerMode = .date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        
        addSubview(datePicker)
        
        datePicker.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        datePicker.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        datePicker.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.9)
        datePicker.autoMatch(.height, to: .height, of: self, withMultiplier: 0.3)
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
        
        if let date = shift.date {
            datePicker.date = date
        }
    }
    
    public func setSelectShiftColorButtonBackground(_ color: UIColor?) {
        selectShiftColorButton.backgroundColor = color
    }
}
