//
//  ShiftButtonSettngs.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 12.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

public let horizontalSpacing: CGFloat = 16

class NewShiftView: UIView {
    
    fileprivate var nameLabel = UILabel()
    fileprivate var nameTextField = UITextField()
    fileprivate var selectFirstShiftDateLabel = UILabel()
    fileprivate let datePicker = UIDatePicker()
    fileprivate var intervalLabel = UILabel()
    var intervalTextField = UITextField()
    fileprivate var selectShiftColorLabel = UILabel()
    var selectShiftColorButton = UIButton()

    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        shiftFirstDate()
        setupConstraints()
        }
    
    func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .white
        nameLabel.text = NSLocalizedString("CreateNewShift_loc003", comment: "")
        nameLabel.textColor = .black
        addSubview(nameLabel)
        
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.layer.borderWidth = 1
        addSubview(nameTextField)
        
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
       /* TODO: validation numbers only not working yet
        func textField(_ textField: UITextField,
                       shouldChangeCharactersIn range: NSRange,
                       replacementString string: String) -> Bool {
            
            // Create an `NSCharacterSet` set which includes everything *but* the digits
            let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
            
            // At every character in this "inverseSet" contained in the string,
            // split the string up into components which exclude the characters
            // in this inverse set
            let components = string.components(separatedBy: inverseSet)
            
            // Rejoin these components
            let filtered = components.joined(separator: "")  // use join("", components) if you are using Swift 1.2
            
            // If the original string is equal to the filtered string, i.e. if no
            // inverse characters were present to be eliminated, the input is valid
            // and the statement returns true; else it returns false
            return string == filtered
        }
        */
        addSubview(intervalTextField)
        
        selectShiftColorLabel.text = ""
        selectShiftColorLabel.textColor = .black
        addSubview(selectShiftColorLabel)
        
        selectShiftColorButton = createButton(color: .blue, name: NSLocalizedString("CreateNewShift_loc007", comment: ""))
        addSubview(selectShiftColorButton)
    }
    
    fileprivate func createButton(color: UIColor, name: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.setTitle(name, for: .normal)
        return button
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
        
        selectFirstShiftDateLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        selectFirstShiftDateLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        selectFirstShiftDateLabel.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.45)
        selectFirstShiftDateLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        
        intervalLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        intervalLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        intervalLabel.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.2)
        intervalLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        
        intervalTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        intervalTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        intervalTextField.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.3)
        intervalTextField.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        selectShiftColorLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        selectShiftColorLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        selectShiftColorLabel.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.5)
        selectShiftColorLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.5)
        
        selectShiftColorButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        selectShiftColorButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        selectShiftColorButton.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.65)
        selectShiftColorButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.1)
        
        }
    
    func shiftFirstDate() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/dd/MM"
        let selectedDate = dateFormatter.string(from: datePicker.date)
        print(selectedDate)
        addSubview(datePicker)
        
        datePicker.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        datePicker.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        datePicker.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.8)
        datePicker.autoMatch(.height, to: .height, of: self, withMultiplier: 0.3)
        }
    
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setActionForColorButton(_ target: Any?, action: Selector) {
        selectShiftColorButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func name() -> String {
        return self.nameTextField.text!
    }
    
    public func interval() -> String {
        return self.intervalTextField.text!
    }
    
    public func date() -> Date {
        return self.datePicker.date
    }
}
