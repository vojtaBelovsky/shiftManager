//
//  EditCallendarDayViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 08.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

final class EditCallendarDayViewController: UIViewController {
    
    fileprivate let editCallendarDayView: EditCallendarDayView
    fileprivate var extraShifts: [ShiftModel] = []
    
    fileprivate var date: Date? {
        didSet{
            
        }
    }
    
    init(with day: Date) {
        editCallendarDayView = EditCallendarDayView(with: day)
        super.init(nibName: nil, bundle: nil)
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
    }
    
    override func loadView() {
        view = editCallendarDayView
    }

    func saveButtonDidPress() {
        if let user = UserManager.sharedInstance.selectedUser {
            let editCalendarDay = EditCalendarDayModel()
            editCalendarDay.freeDay = editCallendarDayView.freeDay()
            editCalendarDay.extraShifts = extraShifts
            editCalendarDay.note = editCallendarDayView.notes()
            user.editCalendarDay = editCalendarDay
//            editCalendarDay.date = 
            UserManager.sharedInstance.update(User: user)
        }

        _ = navigationController?.popViewController(animated: true)
    }
    
    func setActionForShiftButton() {
        let extraShiftViewController = ExtraShiftViewController()
        extraShiftViewController.delegate = self
        navigationController?.pushViewController(extraShiftViewController, animated: true)
    }
}

extension EditCallendarDayViewController: ExtraShiftViewControllerDelegate {
    func setExtraShifts(extraShifts: [ShiftModel]) {
        self.extraShifts = extraShifts
    }
}
