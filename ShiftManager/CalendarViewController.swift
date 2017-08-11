//
//  ViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, RegisterViewControllerDelegate {
    
    let callendarViewControllerIdentifier = "callendarViewControllerIdentifier"
    let calendarView: CalendarView = CalendarView()
    let calendarDataSource = CalendarDataSource()
    let friendsDataSource = FriendsDataSource(friends:
        [UserModel(), UserModel(), UserModel(), UserModel(), UserModel(), UserModel(), UserModel(), UserModel(), UserModel()]
    ) //TODO: Mock data for friendsDataSource, delete in future
    
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
        
        
        calendarView.friendsCollectionVIew.register(FriendCollectionCell.self, forCellWithReuseIdentifier: String(describing: FriendCollectionCell.self))
        calendarView.friendsCollectionVIew.dataSource = friendsDataSource
        calendarView.friendsCollectionVIew.delegate = self
        
        
        //IF isUserRegistered
        
        if (!UserManager().isUserRegistered()) {
            let registerViewController = RegisterViewController()
            registerViewController.delegate = self
            navigationController?.present(registerViewController, animated: true, completion: nil)
        }
    }
    
    func registerViewController(_ controller: RegisterViewController, didRegisterUser: UserModel) {
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
        
        switch collectionView {
        case calendarView.calendarCollectionView:
            navigationController?.pushViewController(EditCallendarDayViewController(), animated: true)
        case calendarView.friendsCollectionVIew:
            break //TODO: Handle tap on friend cell
        default: return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case calendarView.calendarCollectionView: return calendarView.getCalendarCellSize()
        case calendarView.friendsCollectionVIew: return calendarView.getFriendsCellSize()
        default: return CGSize(width: 0, height: 0)
        }
    }
}

