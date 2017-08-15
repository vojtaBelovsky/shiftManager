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
    let calendarView: CalendarView = CalendarView()
    let calendarDataSource = CalendarDataSource()

    override func loadView() {
        view = calendarView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        title = NSLocalizedString("Calendar_loc001", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(settingsButtonDidPress))
        edgesForExtendedLayout = UIRectEdge.bottom
        
        calendarView.calendarCollectionView.dataSource = calendarDataSource
        calendarView.calendarCollectionView.delegate = self
        calendarView.calendarCollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier:calendarCollectionViewCellReuseIdentifier)
        calendarView.calendarCollectionView.register(CalendarEmtpyCollectionViewCell.self, forCellWithReuseIdentifier:calendarCollectionViewCellEmptyCellCount)
        calendarView.calendarCollectionView.register(CalendarHeaderView.self,
                                             forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                             withReuseIdentifier: CalendarHeaderView.calendarHeaderIdentifier)
        
        //IF isUserRegistered
        
        if (!UserManager.sharedInstance.isUserRegistered()) {
            let newUserViewController = NewUserViewController()
            newUserViewController.delegate = self
            navigationController?.present(newUserViewController, animated: true, completion: nil)
        }
    }
    
    func newUserViewController(_ controller: NewUserViewController, didRegisterUser: UserModel) {
        controller.dismiss(animated: true, completion: nil)
    }

    func settingsButtonDidPress() {
        navigationController?.pushViewController(SettingsViewController(), animated: true)
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

