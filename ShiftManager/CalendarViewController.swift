//
//  ViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, NewUserViewControllerDelegate {
    
    let callendarViewControllerIdentifier = "callendarViewControllerIdentifier"
    let calendarView = CalendarView()
    let calendarDataSource = CalendarDataSource()
    let userBarView = UserBarView()

    override func loadView() {
        view = calendarView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("Calendar_loc001", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(settingsButtonDidPress))
        edgesForExtendedLayout = UIRectEdge.bottom
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(newUserDidRegisterNotificationHandler), name: newUserDidRegisterNotification, object: nil)
        calendarView.calendarCollectionView.dataSource = calendarDataSource
        calendarView.calendarCollectionView.delegate = self
        calendarView.calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CalendarCollectionViewCell.self))
        calendarView.calendarCollectionView.register(CalendarEmtpyCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CalendarEmtpyCollectionViewCell.self))
        calendarView.calendarCollectionView.register(CalendarHeaderView.self,
                                             forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                             withReuseIdentifier: CalendarHeaderView.calendarHeaderIdentifier)
    }
    
    func newUserViewController(_ controller: NewUserViewController, didRegisterUser: UserModel) {
        controller.dismiss(animated: true, completion: nil)
    }

    func settingsButtonDidPress() {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    func newUserDidRegisterNotificationHandler(){
        calendarView.userBarView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

