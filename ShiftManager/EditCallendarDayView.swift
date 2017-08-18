//
//  EditCallendarDay.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 08.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout

final class EditCallendarDayView: UIView {
    
    fileprivate let infoLabel = UILabel()
    fileprivate let dateLabel = UILabel()
    fileprivate let shiftName = UILabel()
    fileprivate let extraShiftButton = UIButton()
    fileprivate let dayOffLabel = UILabel()
    fileprivate let dayOffSwitch = UISwitch()
    fileprivate let noteLabel = UILabel()
    fileprivate let note = UITextView()
    
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        todayDateForLabel()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        backgroundColor = .white
        
        infoLabel.text = NSLocalizedString("BasicInfo_loc001", comment: "")
        infoLabel.textColor = .black
        addSubview(infoLabel)
        
        dateLabel.textColor = .black
        addSubview(dateLabel)
        
        shiftName.text = "//TODO: Název vybrané šichty"
        shiftName.textColor = .black
        addSubview(shiftName)
        
        extraShiftButton.backgroundColor = .red
        extraShiftButton.setTitle(NSLocalizedString("ExtraShiftButton_loc001", comment: ""), for: .normal)
        addSubview(extraShiftButton)
        
        dayOffLabel.text = NSLocalizedString("DayOffLabel_loc001", comment: "")
        dayOffLabel.textColor = .black
        addSubview(dayOffLabel)
        
        dayOffSwitch.setOn(false, animated: true)
        dayOffSwitch.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        addSubview(dayOffSwitch)
        
        
        noteLabel.text = NSLocalizedString("NoteLabel_loc001", comment: "")
        noteLabel.textColor = .black
        addSubview(noteLabel)
        
        note.textAlignment = NSTextAlignment.justified
        note.textColor = UIColor.black
        note.backgroundColor = UIColor.white
        note.layer.borderColor = UIColor.black.cgColor
        note.layer.borderWidth = 1
        addSubview(note)
    }
    
    fileprivate func setupConstraints() {
        
        infoLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        infoLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        infoLabel.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.1)
        infoLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        dateLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        dateLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        dateLabel.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.2)
        dateLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        shiftName.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        shiftName.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        shiftName.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.3)
        shiftName.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        extraShiftButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        extraShiftButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        extraShiftButton.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.6)
        extraShiftButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        dayOffLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        dayOffLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        dayOffLabel.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.8)
        dayOffLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        dayOffSwitch.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        dayOffSwitch.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 0.8)
        dayOffSwitch.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        noteLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        noteLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        noteLabel.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.0)
        noteLabel.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        note.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        note.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        note.autoAlignAxis(.horizontal, toSameAxisOf: self, withMultiplier: 1.3)
        note.autoMatch(.height, to: .height, of: self, withMultiplier: 0.2)
        
    }
    
    fileprivate func todayDateForLabel() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy, EEEE"
        dateLabel.text = "\(formatter.string(from: Date()))"
    }
    
    func switchValueDidChange(sender: UISwitch) {
        extraShiftButton.isEnabled = !dayOffSwitch.isOn
        extraShiftButton.backgroundColor = dayOffSwitch.isOn ? UIColor.red.withAlphaComponent(0.3) : .red
    }
}

extension EditCallendarDayView {

    public func setActionForShiftButton(_ target: Any?, action: Selector) {
        extraShiftButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func freeDay() -> Bool {
        return true
    }
    
    public func notes() -> String {
        return self.note.text ?? ""
    }
}
