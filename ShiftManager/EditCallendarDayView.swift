//
//  EditCallendarDay.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 08.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import PureLayout

final class EditCallendarDayView: UIView {
    
    fileprivate let infoLabel = UILabel()
    fileprivate let dateLabel = UILabel()
    fileprivate let shiftNameLabel = UILabel()
    fileprivate let extraShiftButton = UIButton()
    fileprivate let dayOffLabel = UILabel()
    fileprivate let dayOffSwitch = UISwitch()
    fileprivate let noteLabel = UILabel()
    fileprivate let noteTextView = UITextView()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    fileprivate func setup() {
        initializeViewsAndAddThemAsSubviews()
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
        
        shiftNameLabel.textColor = .black
        shiftNameLabel.numberOfLines = 0
        addSubview(shiftNameLabel)
        
        extraShiftButton.backgroundColor = .red
        extraShiftButton.setTitle(NSLocalizedString("ExtraShiftButton_loc001", comment: ""), for: .normal)
        addSubview(extraShiftButton)
        
        dayOffLabel.text = NSLocalizedString("DayOffLabel_loc001", comment: "")
        dayOffLabel.textColor = .black
        addSubview(dayOffLabel)
        
        dayOffSwitch.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        addSubview(dayOffSwitch)

        
        noteLabel.text = NSLocalizedString("NoteLabel_loc001", comment: "")
        noteLabel.textColor = .black
        addSubview(noteLabel)
        
        noteTextView.textAlignment = NSTextAlignment.justified
        noteTextView.textColor = UIColor.black
        noteTextView.backgroundColor = UIColor.white
        noteTextView.layer.borderColor = UIColor.black.cgColor
        noteTextView.layer.borderWidth = 1
        addSubview(noteTextView)
    }
    
    fileprivate func setupConstraints() {
        infoLabel.autoPinEdge(toSuperviewEdge: .top, withInset: Spacing.VerticalSpacing)
        infoLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        infoLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)

        dateLabel.autoPinEdge(.top, to: .bottom, of: infoLabel, withOffset: Spacing.VerticalSpacing/2)
        dateLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        dateLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        shiftNameLabel.autoPinEdge(.top, to: .bottom, of: dateLabel, withOffset: Spacing.VerticalSpacing/2)
        shiftNameLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        shiftNameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        extraShiftButton.autoPinEdge(.top, to: .bottom, of: shiftNameLabel, withOffset: Spacing.VerticalSpacing*2)
        extraShiftButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        extraShiftButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        extraShiftButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)
        
        dayOffLabel.autoPinEdge(.top, to: .bottom, of: extraShiftButton, withOffset: Spacing.VerticalSpacing*2)
        dayOffLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        
        dayOffSwitch.autoPinEdge(.leading, to: .trailing, of: dayOffLabel, withOffset: Spacing.HorizontalSpacing)
        dayOffSwitch.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        dayOffSwitch.autoAlignAxis(.horizontal, toSameAxisOf: dayOffLabel)
        
        noteLabel.autoPinEdge(.top, to: .bottom, of: dayOffLabel, withOffset: Spacing.VerticalSpacing*2)
        noteLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        noteLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        noteTextView.autoPinEdge(.top, to: .bottom, of: noteLabel, withOffset: Spacing.VerticalSpacing)
        noteTextView.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        noteTextView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        noteTextView.autoMatch(.height, to: .height, of: self, withMultiplier: 0.2)
        noteTextView.autoPinEdge(toSuperviewEdge: .bottom, withInset: Spacing.VerticalSpacing, relation: .greaterThanOrEqual)
        
    }
    
    func setSwitch(switchIsOn: Bool) {
        extraShiftButton.isEnabled = !switchIsOn
    }
    
    func switchValueDidChange(sender: UISwitch) {
        setSwitch(switchIsOn: sender.isOn)
    }
}

extension EditCallendarDayView {

    public func setActionForShiftButton(_ target: Any?, action: Selector) {
        extraShiftButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    public func freeDay() -> Bool {
        return dayOffSwitch.isOn
    }
    
    public func notes() -> String {
        return self.noteTextView.text ?? ""
    }
    
    public func setDate(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "d.M.yyyy"
        dateLabel.text = "\(formatter.string(from: date))"
    }
    
    public func setExtraShifts(extraShifts: [ShiftModel]) {
        var finalShiftNamesText: String = ""
        extraShifts.forEach { shiftName in
            finalShiftNamesText = finalShiftNamesText.isEmpty
                ? "\(shiftName.name)"
                : "\(finalShiftNamesText)\n\(shiftName.name)"
        }
        shiftNameLabel.text = finalShiftNamesText
    }
    
    public func setupView(with model: EditCalendarDayModel) {
        noteTextView.text = model.note
        dayOffSwitch.isOn = model.freeDay
        setExtraShifts(extraShifts: model.extraShifts)
    }
}
