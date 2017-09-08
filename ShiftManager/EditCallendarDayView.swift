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
    
    //fileprivate let infoLabel = UILabel()
    fileprivate let dateLabel = UILabel()
    fileprivate let extraShiftStackView = UIStackView()
    fileprivate let extraShiftButton = UIButton()
    fileprivate let dayOffLabel = UILabel()
    fileprivate let dayOffSwitch = UISwitch()
    fileprivate let noteLabel = UILabel()
    fileprivate let noteTextView = UITextView()
    let navigationBar = NavigationBar()
    var extraShifts: [ShiftModel] = [] {
        didSet {
            removeSubviewsFromStackView()
            extraShifts.forEach { shiftModel in
                let extraShiftView = LabelWithButtonView(with: shiftModel.name)
                extraShiftStackView.addArrangedSubview(extraShiftView)
            }
        }
    }
    
    init() {
        super.init(frame: .zero)
        setup()
        navigationBar.setImage(#imageLiteral(resourceName: "saveIcon"))
    }
    
    fileprivate func setup() {
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        
        backgroundColor = .clear
        /*
        infoLabel.text = NSLocalizedString("BasicInfo_loc001", comment: "")
        infoLabel.textColor = .black
        addSubview(infoLabel)
        */
        dateLabel.textColor = .black
        addSubview(dateLabel)
        
        extraShiftStackView.axis = .vertical
        extraShiftStackView.spacing = 10.0
        extraShiftStackView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        addSubview(extraShiftStackView)
        
        extraShiftButton.backgroundColor = .red
        extraShiftButton.layer.cornerRadius = 17
        extraShiftButton.layer.borderWidth = 1
        extraShiftButton.setTitle(NSLocalizedString("ExtraShiftButton_loc001", comment: ""), for: .normal)
        addSubview(extraShiftButton)
        
        dayOffLabel.text = NSLocalizedString("DayOffLabel_loc001", comment: "")
        dayOffLabel.textColor = .black
        addSubview(dayOffLabel)
        
        dayOffSwitch.addTarget(self, action: #selector(freeDay), for: .valueChanged)
        addSubview(dayOffSwitch)

        
        noteLabel.text = NSLocalizedString("NoteLabel_loc001", comment: "")
        noteLabel.textColor = .black
        noteLabel.textAlignment = .center
        addSubview(noteLabel)
        
        noteTextView.textAlignment = NSTextAlignment.natural
        noteTextView.textColor = UIColor.black
        noteTextView.font = UIFont.systemFont(ofSize: 18)
        noteTextView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        noteTextView.layer.borderColor = UIColor.black.cgColor
        noteTextView.layer.borderWidth = 1
        addSubview(noteTextView)
        addSubview(navigationBar)
    }
    
    fileprivate func setupConstraints() {
        
        navigationBar.autoPinEdge(.bottom, to: .top, of: extraShiftButton, withOffset: -30)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        
        //extraShiftButton.autoPinEdge(.top, to: .bottom, of: extraShiftStackView, withOffset: Spacing.VerticalSpacing*2)
        extraShiftButton.autoPinEdge(.top, to: .bottom, of: navigationBar)
        extraShiftButton.autoPinEdge(.bottom, to: .top, of: extraShiftStackView, withOffset: -20)
        extraShiftButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        extraShiftButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        //extraShiftButton.autoMatch(.height, to: .height, of: self, withMultiplier: 0.05)

        extraShiftStackView.autoPinEdge(.bottom, to: .top, of: dayOffLabel, withOffset: -35)
        extraShiftStackView.autoPinEdge(.top, to: .bottom, of: extraShiftButton)
        extraShiftStackView.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        extraShiftStackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        dayOffLabel.autoPinEdge(.top, to: .bottom, of: extraShiftStackView, withOffset: -20)
        dayOffLabel.autoPinEdge(.bottom, to: .top, of: noteLabel, withOffset: -20)
        dayOffLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        
        dayOffSwitch.autoPinEdge(.leading, to: .trailing, of: dayOffLabel, withOffset: Spacing.HorizontalSpacing)
        dayOffSwitch.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        dayOffSwitch.autoAlignAxis(.horizontal, toSameAxisOf: dayOffLabel)
        //dayOffSwitch.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        
        noteLabel.autoPinEdge(.top, to: .bottom, of: dayOffLabel, withOffset: Spacing.HorizontalSpacing)
        noteLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        noteLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        noteTextView.autoPinEdge(.top, to: .bottom, of: noteLabel, withOffset: Spacing.HorizontalSpacing)
        noteTextView.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        noteTextView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        noteTextView.autoMatch(.height, to: .height, of: self, withMultiplier: 0.2)
        noteTextView.autoPinEdge(toSuperviewEdge: .bottom, withInset: Spacing.VerticalSpacing, relation: .greaterThanOrEqual)
        
        // infoLabel.autoPinEdge(toSuperviewEdge: .top, withInset: Spacing.VerticalSpacing)
        // infoLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        // infoLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        /*
         dateLabel.autoPinEdge(.top, to: .bottom, of: infoLabel, withOffset: Spacing.VerticalSpacing/2)
         dateLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
         dateLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
         */
        
    }
    
    func setSwitch() {
        extraShiftButton.isEnabled = !dayOffSwitch.isOn
    }
    
    func switchValueDidChange(sender: UISwitch) {
        setSwitch()
    }
    
    fileprivate func removeSubviewsFromStackView() {
        extraShiftStackView.subviews.forEach { subview in
            extraShiftStackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
    }
    
    fileprivate func deleteShift(at index: Int) {
        let subviewForDelete = extraShiftStackView.subviews[index]
        extraShiftStackView.removeArrangedSubview(subviewForDelete)
        subviewForDelete.removeFromSuperview()
    }
    
    func extraShiftTitleWithButtonPressed(sender: UIButton) {
        deleteShift(at: sender.tag)
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
        //dateLabel.text = "\(formatter.string(from: date))"
       // navigationBar.setTitle(NSLocalizedString("ExtraShiftName_loc001", comment: ""))
        navigationBar.setTitle("\(formatter.string(from: date))")
        //(formatter.string(from: date)
    }

    public func setExtraShifts(extraShifts: [ShiftModel]) {
        removeSubviewsFromStackView()
        for (index, element) in extraShifts.enumerated() {
            let titleWithButton = LabelWithButtonView(with: element.name)
            extraShiftStackView.addArrangedSubview(titleWithButton)
            titleWithButton.button.addTarget(self, action: #selector(extraShiftTitleWithButtonPressed), for: .touchUpInside)
            titleWithButton.button.tag = index
        }
    }

    public func setupView(with model: EditCalendarDayModel) {
        noteTextView.text = model.note
        dayOffSwitch.isOn = model.freeDay
        extraShifts = model.extraShifts
    }
}
