//
//  EditCallendarDayViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 08.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

final class EditCallendarDayViewController: UIViewController {
    
    fileprivate let editCallendarDayView = EditCallendarDayView()
    fileprivate var editCalendarDay = EditCalendarDayModel()
    fileprivate var extraShifts: [ShiftModel] = []
    
    // WARNING: DIRTY HACK - because DidSet was not called in this case, so Get and Set func was implemented!!!
    // Probably would be better to get rid of it
    fileprivate var _date: Date
    fileprivate var date: Date {
        get {
            return _date
        }
        set(newValue) {
            _date = newValue
            editCallendarDayView.setDate(date: newValue)
        }
    }
    
    init(with day: Date) {
        _date = day
        super.init(nibName: nil, bundle: nil)
        date = day
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("EditCallendarDayViewTitle_loc001", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonDidPress))
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        editCallendarDayView.setActionForShiftButton(self, action: #selector(setActionForShiftButton))
        
        setupViewData()
    }
    
    override func loadView() {
        view = editCallendarDayView
    }

    func saveButtonDidPress() {
        editCalendarDay.freeDay = editCallendarDayView.freeDay()
        editCalendarDay.extraShifts = extraShifts
        editCalendarDay.note = editCallendarDayView.notes()
        editCalendarDay.date = date
        UserManager.sharedInstance.saveEditCalendarDayModel(editCalendarDay)

        _ = navigationController?.popViewController(animated: true)
    }
    
    fileprivate func setupViewData() {
        guard let model = UserManager.sharedInstance.selectedUser?.editCalendarDays[date] else { return }
        editCallendarDayView.setupView(with: model)
    }
    
    func setActionForShiftButton() {
        let extraShiftViewController = ExtraShiftViewController()
        extraShiftViewController.delegate = self
        navigationController?.pushViewController(extraShiftViewController, animated: true)
    }
}

extension EditCallendarDayViewController: ExtraShiftViewControllerDelegate {
    public func setExtraShifts(extraShifts: [ShiftModel]) {
        self.extraShifts = extraShifts
        
        editCallendarDayView.setExtraShifts(extraShifts: extraShifts)
    }
}
