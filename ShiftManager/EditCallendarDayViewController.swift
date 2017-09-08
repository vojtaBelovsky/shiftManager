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
    fileprivate var editCalendarDayModel = EditCalendarDayModel()

    
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
       // title = NSLocalizedString("EditCallendarDayViewTitle_loc001", comment: "")
        //navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonDidPress))
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        editCallendarDayView.setActionForShiftButton(self, action: #selector(setActionForShiftButton))
        editCallendarDayView.navigationBar.backButtonSetAction(self, action: #selector(setActionForBackButton))
        editCallendarDayView.navigationBar.actionButtonSetAction(self, action: #selector(saveButtonDidPress))
        setupViewData()
    }
    
    override func loadView() {
        view = editCallendarDayView
    }

    func saveButtonDidPress() {
        editCalendarDayModel.freeDay = editCallendarDayView.freeDay()
        editCalendarDayModel.extraShifts = editCallendarDayView.extraShifts
        editCalendarDayModel.note = editCallendarDayView.notes()
        editCalendarDayModel.date = date
        UserManager.sharedInstance.saveEditCalendarDayModel(editCalendarDayModel)
        
        NotificationCenter.default.post(name: reloadCalendarView, object: nil)
        navigationController?.isNavigationBarHidden = false
        _ = navigationController?.popViewController(animated: true)
    }
    
    fileprivate func setupViewData() {
        guard let model = UserManager.sharedInstance.selectedUser?.editCalendarDays[date] else { return }
        editCalendarDayModel = model
        editCallendarDayView.setupView(with: model)
    }
    
    func setActionForBackButton(){
        navigationController?.isNavigationBarHidden = false
         _ = navigationController?.popViewController(animated: true)
    }
    
    func setActionForShiftButton() {
        let extraShiftViewController = ExtraShiftViewController(date: date)
        extraShiftViewController.delegate = self
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(extraShiftViewController, animated: true)
    }
}

extension EditCallendarDayViewController: ExtraShiftViewControllerDelegate {
    public func setExtraShifts(extraShifts: [ShiftModel]) {
        editCallendarDayView.extraShifts = extraShifts
    }
}
