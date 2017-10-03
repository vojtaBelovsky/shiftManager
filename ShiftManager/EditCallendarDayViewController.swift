//
//  EditCallendarDayViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 08.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

final class EditCallendarDayViewController: UIViewController, UITextViewDelegate {
    
    fileprivate let editCallendarDayView = EditCallendarDayView()
    
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
        navigationController?.isNavigationBarHidden = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bcg")
        self.view.insertSubview(backgroundImage, at: 0)
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        editCallendarDayView.setActionForManageButton(self, action: #selector(setActionForManageButton))
        editCallendarDayView.navigationBar.setBackButton(self, action: #selector(setActionForBackButton))
        editCallendarDayView.navigationBar.setActionButton(self, action: #selector(saveButtonDidPress))
        setupViewData()
        
        editCallendarDayView.noteTextView.delegate = self
        editCallendarDayView.placeholderLabel.isHidden = !editCallendarDayView.noteTextView.text.isEmpty
    }
    
    func textViewDidChange(_ noteTextView: UITextView) {
        editCallendarDayView.placeholderLabel.isHidden = !editCallendarDayView.noteTextView.text.isEmpty
    }
    
    override func loadView() {
        view = editCallendarDayView
    }
    
    @objc func saveButtonDidPress() {
        let model = editCallendarDayView.editCalendarDayModel
        model.freeDay = editCallendarDayView.freeDay()
        model.note = editCallendarDayView.notes()
        model.date = date
        UserManager.sharedInstance.saveEditCalendarDayModel(model)
        
        NotificationCenter.default.post(name: reloadCalendarView, object: nil)
        _ = navigationController?.popViewController(animated: true)
    }
    
    fileprivate func setupViewData() {
        guard let model = UserManager.sharedInstance.selectedUser?.editCalendarDays[date],
            let modelCopy = model.copy() as? EditCalendarDayModel
            else {
                return
        }
        editCallendarDayView.editCalendarDayModel = modelCopy
    }
    
    @objc func setActionForBackButton(){
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func setActionForManageButton() {
        let extraShiftViewController = ExtraShiftViewController(editCalendarDayModel: editCallendarDayView.editCalendarDayModel)
        extraShiftViewController.delegate = self
        
        navigationController?.pushViewController(extraShiftViewController, animated: true)
    }
}

extension EditCallendarDayViewController: ExtraShiftViewControllerDelegate {
    public func setExtraShifts(extraShifts: [ShiftModel]) {
        editCallendarDayView.setExtraShifts(extraShifts: extraShifts)
    }
}
