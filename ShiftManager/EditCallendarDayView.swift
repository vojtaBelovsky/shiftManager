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
    
    let navigationBar = NavigationBar()
    fileprivate let scrollView = UIScrollView()
    fileprivate let contentHolder = UIView()
    fileprivate let dateLabel = UILabel()
    fileprivate let extraShiftButton = UIButton()
    fileprivate let extraShiftStackView = UIStackView()
    fileprivate let dayOffLabel = UILabel()
    fileprivate let dayOffSwitch = UISwitch()
    fileprivate let noteLabel = UILabel()
    let noteTextView = UITextView()
    let placeholderLabel = UILabel()
    var editCalendarDayModel = EditCalendarDayModel() {
        didSet {
            setupView(with: editCalendarDayModel)
        }
    }
    
    init() {
        super.init(frame: .zero)
        setup()
        navigationBar.setImage(#imageLiteral(resourceName: "saveIcon"))
        navigationBar.setBackImage(#imageLiteral(resourceName: "backIcon"))
    }
    
    fileprivate func setup() {
        initializeViewsAndAddThemAsSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func initializeViewsAndAddThemAsSubviews() {
        
        addSubview(navigationBar)
        addSubview(scrollView)
        addSubviewToScrollView()
        
        backgroundColor = .clear
        dateLabel.textColor = .black
        addSubview(dateLabel)
        
        extraShiftStackView.axis = .vertical
        extraShiftStackView.spacing = 10.0
        extraShiftStackView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        
        extraShiftButton.backgroundColor = Colors.papaya
        extraShiftButton.setTitle(NSLocalizedString("ExtraShiftButton_loc001", comment: ""), for: .normal)
        
        dayOffLabel.text = NSLocalizedString("DayOffLabel_loc001", comment: "")
        dayOffLabel.textColor = .black
        
        dayOffSwitch.addTarget(self, action: #selector(freeDay), for: .valueChanged)

        noteLabel.text = NSLocalizedString("NoteLabel_loc001", comment: "")
        noteLabel.textColor = .black
        noteLabel.textAlignment = .center
        
        noteTextView.textAlignment = NSTextAlignment.natural
        noteTextView.textColor = UIColor.black
        noteTextView.font = UIFont.systemFont(ofSize: 18)
        noteTextView.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        noteTextView.layer.borderColor = UIColor.black.cgColor
        noteTextView.layer.borderWidth = 1
        noteTextView.addSubview(placeholderLabel)
        
        placeholderLabel.text = NSLocalizedString("NoteLabel_loc002", comment: "")
        placeholderLabel.font = UIFont.italicSystemFont(ofSize: (noteTextView.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (noteTextView.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.darkGray
    }
    
    fileprivate func addSubviewToScrollView() {
        scrollView.addSubview(contentHolder)
        [extraShiftButton, extraShiftStackView, dayOffLabel, dayOffSwitch, noteLabel, noteTextView].forEach { subview in
            contentHolder.addSubview(subview)
        }
    }
    
    fileprivate func setupConstraints() {
        navigationBar.autoPinEdge(toSuperviewEdge: .top)
        navigationBar.autoPinEdge(toSuperviewEdge: .leading)
        navigationBar.autoPinEdge(toSuperviewEdge: .trailing)
        
        scrollView.autoPinEdge(.top, to: .bottom, of: navigationBar, withOffset: Spacing.DoubleVertialSpacing)
        scrollView.autoPinEdge(toSuperviewEdge: .leading)
        scrollView.autoPinEdge(toSuperviewEdge: .trailing)
        scrollView.autoPinEdge(toSuperviewEdge: .bottom)
        
        contentHolder.autoMatch(.width, to: .width, of: self)
        contentHolder.autoPinEdgesToSuperviewEdges()
        
        extraShiftButton.autoPinEdge(toSuperviewEdge: .top)
        extraShiftButton.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        extraShiftButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)

        extraShiftStackView.autoPinEdge(.top, to: .bottom, of: extraShiftButton, withOffset: Spacing.DoubleVertialSpacing)
        extraShiftStackView.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        extraShiftStackView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        dayOffLabel.autoPinEdge(.top, to: .bottom, of: extraShiftStackView, withOffset: Spacing.DoubleVertialSpacing)
        dayOffLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        
        dayOffSwitch.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        dayOffSwitch.autoAlignAxis(.horizontal, toSameAxisOf: dayOffLabel)
        
        noteLabel.autoPinEdge(.top, to: .bottom, of: dayOffLabel, withOffset: Spacing.DoubleVertialSpacing)
        noteLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        noteLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        
        noteTextView.autoPinEdge(.top, to: .bottom, of: noteLabel, withOffset: Spacing.VerticalSpacing)
        noteTextView.autoPinEdge(toSuperviewEdge: .leading, withInset: Spacing.HorizontalSpacing)
        noteTextView.autoPinEdge(toSuperviewEdge: .trailing, withInset: Spacing.HorizontalSpacing)
        noteTextView.autoSetDimension(.height, toSize: 150)
        noteTextView.autoPinEdge(toSuperviewEdge: .bottom, withInset: Spacing.DoubleVertialSpacing)
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
    
    func extraShiftTitleWithButtonPressed(sender: UIButton) {
        var extraShifts = editCalendarDayModel.extraShifts
        extraShifts.remove(at: sender.tag)
        setExtraShifts(extraShifts: extraShifts)
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
        navigationBar.setTitle("\(formatter.string(from: date))")
    }

    public func setExtraShifts(extraShifts: [ShiftModel]) {
        removeSubviewsFromStackView()
        for (index, element) in extraShifts.enumerated() {
            let titleWithButton = LabelWithButtonView(with: element.name)
            extraShiftStackView.addArrangedSubview(titleWithButton)
            titleWithButton.button.addTarget(self, action: #selector(extraShiftTitleWithButtonPressed), for: .touchUpInside)
            titleWithButton.button.tag = index
        }
        editCalendarDayModel.extraShifts = extraShifts
    }

    public func setupView(with model: EditCalendarDayModel) {
        noteTextView.text = model.note
        dayOffSwitch.isOn = model.freeDay
        setExtraShifts(extraShifts: model.extraShifts)
    }
}
