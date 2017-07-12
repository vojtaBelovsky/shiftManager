//
//  ViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    

    let calendarView: CalendarView = CalendarView()
    let calendarDataSource = CalendarDataSource()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func loadView() {
        view = calendarView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shift manager"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(settingsButtonDidPress))
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        calendarView.collectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier:calendarCollectionViewCellReuseIdentifier)
        calendarView.collectionView.register(CalendarEmtpyCollectionViewCell.self, forCellWithReuseIdentifier:calendarCollectionViewCellEmptyCellCount)
        calendarView.collectionView.dataSource = calendarDataSource
        
    }

    func settingsButtonDidPress() {
        self.navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension CalendarViewController: UICollectionViewDelegate {
    
}

