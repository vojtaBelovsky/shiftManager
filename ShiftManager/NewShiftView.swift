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
    
    fileprivate let nameLabel = UILabel()
    fileprivate let nameTextField = BoundedTextField()
    fileprivate let shortcutTextField = BoundedTextField()
    fileprivate let selectFirstShiftDateLabel = UILabel()
    fileprivate let datePicker = UIDatePicker()
    fileprivate let intervalLabel = UILabel()
    fileprivate let intervalTextField = BoundedTextField()
    fileprivate let selectShiftColorButton = UIButton()
    fileprivate let scrollView = UIScrollView()
    fileprivate let contentHolder = UIView()
    let navigationBar = NavigationBar()
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        shiftFirstDate()
        setupConstraints()
        navigationBar.setTitle(NSLocalizedString("CreateNewShift_loc002", comment: ""))
        navigationBar.setImage(#imageLiteral(resourceName: "saveIcon"))
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
      //  backgroundColor = .white
        nameTextField.backgroundColor = UIColor.white.withAlphaComponent(0.4)

        nameLabel.text = NSLocalizedString("CreateNewShift_loc003", comment: "")
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
        
        
        shortcutTextField.placeholder = NSLocalizedString("CreateNewShift_loc008", comment: "")
        shortcutTextField.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        
        selectFirstShiftDateLabel.text = NSLocalizedString("CreateNewShift_loc004", comment: "")
        selectFirstShiftDateLabel.textColor = .black
        selectFirstShiftDateLabel.textAlignment = .center
        
        intervalLabel.text = NSLocalizedString("CreateNewShift_loc005", comment: "")
        intervalLabel.textColor = .black
        intervalLabel.textAlignment = .center
        
        intervalTextField.placeholder = NSLocalizedString("CreateNewShift_loc006", comment: "")
        intervalTextField.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        intervalTextField.keyboardType = UIKeyboardType.numberPad
        
        selectShiftColorButton.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        selectShiftColorButton.layer.cornerRadius = 50.0
        selectShiftColorButton.clipsToBounds = true
        
        selectShiftColorButton.layer.masksToBounds = true
        selectShiftColorButton.setTitle(NSLocalizedString("CreateNewShift_loc007", comment: ""), for: .normal)
        selectShiftColorButton.setTitleColor(.black, for: UIControlState.normal)
        selectShiftColorButton.layer.borderColor = UIColor.black.cgColor
        selectShiftColorButton.layer.borderWidth = 1
        
        datePicker.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        addSubview(scrollView)
        addSubview(navigationBar)
        addSubviewToScrollView()
    }
    
    fileprivate func addSubviewToScrollView() {
        scrollView.addSubview(contentHolder)

        [nameLabel, nameTextField, shortcutTextField, selectFirstShiftDateLabel, datePicker, intervalLabel, intervalTextField, selectShiftColorButton ].forEach { subview in
            contentHolder.addSubview(subview)
        }
    }
    
    fileprivate func setupConstraints() {
        scrollView.autoPinEdgesToSuperviewEdges()
        
        navigationBar.autoPinEdge(.bottom, to: .top, of: nameLabel)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        
        contentHolder.autoMatch(.width, to: .width, of: self)
        contentHolder.autoPinEdgesToSuperviewEdges()
        
        nameLabel.autoPinEdge(toSuperviewEdge: .top, withInset: Spacing.VerticalSpacing)
        nameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        nameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        nameTextField.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: Spacing.VerticalSpacing)
        nameTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        nameTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        shortcutTextField.autoPinEdge(.top, to: .bottom, of: nameTextField, withOffset: Spacing.VerticalSpacing)
        shortcutTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        shortcutTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        selectFirstShiftDateLabel.autoPinEdge(.top, to: .bottom, of: shortcutTextField, withOffset: Spacing.VerticalSpacing)
        selectFirstShiftDateLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        selectFirstShiftDateLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        datePicker.autoPinEdge(.top, to: .bottom, of: selectFirstShiftDateLabel, withOffset: Spacing.VerticalSpacing)
        datePicker.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing, relation: .greaterThanOrEqual)
        datePicker.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing, relation: .greaterThanOrEqual)
        datePicker.autoAlignAxis(toSuperviewAxis: .vertical)
        
        intervalLabel.autoPinEdge(.top, to: .bottom, of: datePicker, withOffset: Spacing.VerticalSpacing)
        intervalLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        intervalLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        intervalTextField.autoPinEdge(.top, to: .bottom, of: intervalLabel, withOffset: Spacing.VerticalSpacing)
        intervalTextField.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        intervalTextField.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        selectShiftColorButton.autoPinEdge(.top, to: .bottom, of: intervalTextField, withOffset: Spacing.VerticalSpacing)
        selectShiftColorButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        selectShiftColorButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        selectShiftColorButton.autoSetDimension(.height, toSize: 100.0)
        selectShiftColorButton.autoPinEdge(toSuperviewEdge: .bottom, withInset: Spacing.VerticalSpacing)
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
