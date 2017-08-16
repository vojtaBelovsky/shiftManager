//
//  ViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class CalendarViewController: UIViewController {
    
    fileprivate let calendarView = CalendarView()
    fileprivate let calendarDataSource = CalendarDataSource()

    override func loadView() {
        view = calendarView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("Calendar_loc001", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(settingsButtonDidPress))
        edgesForExtendedLayout = UIRectEdge.bottom
        
        let newUserDidRegister = NotificationCenter.default
        newUserDidRegister.addObserver(self, selector: #selector(newUserDidRegisterNotificationHandler), name: newUserDidRegisterNotification, object: nil)
        
        let updateUser = NotificationCenter.default
        updateUser.addObserver(self, selector: #selector(updateUserNotificationHandler), name: updateUserNotification, object: nil)
        
        let deleteUser = NotificationCenter.default
        deleteUser.addObserver(self, selector: #selector(deleteUserNotificationHandler), name: deleteUserNotification, object: nil)

        calendarView.calendarCollectionView.dataSource = calendarDataSource
        calendarView.calendarCollectionView.delegate = self
        calendarView.calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CalendarCollectionViewCell.self))
        calendarView.calendarCollectionView.register(CalendarEmtpyCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CalendarEmtpyCollectionViewCell.self))
        calendarView.calendarCollectionView.register(CalendarHeaderView.self,
                                             forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                             withReuseIdentifier: String(describing: CalendarHeaderView.self))
    }

    func settingsButtonDidPress() {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    func updateUserNotificationHandler(){
        calendarView.userBarView.reloadData()
    }
    
    func deleteUserNotificationHandler(){
        calendarView.userBarView.reloadData()
    }
    
    func newUserDidRegisterNotificationHandler() {
        calendarView.userBarView.reloadData()
    }
}

extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(EditCallendarDayViewController(), animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return calendarView.getCalendarCellSize()
    }
}

extension CalendarViewController: NewUserViewControllerDelegate {
    func newUserViewController(_ controller: NewUserViewController, didRegisterUser: UserModel) {
        controller.dismiss(animated: true, completion: nil)
    }
}
