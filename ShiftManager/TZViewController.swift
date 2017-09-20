//
//  TZViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 20.09.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class TZViewController: UIViewController {
    
    let tzView = TZView()
    
    override func loadView() {
        view = tzView
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bcg")
        self.view.insertSubview(backgroundImage, at: 0)
        
        tzView.chengeValue(self, action: #selector(segmentedValueChanged))
        tzView.noButtonDidPress(self, action: #selector(noButtonPress))
        tzView.yesButtonDidPress(self, action: #selector(yesButtonPress))
        tzView.okButtonDidPress(self, action: #selector(okButtonPress))
    }

    func segmentedValueChanged()
    {
        print("Selected Segment Index is : \(tzView.segmentControl.selectedSegmentIndex)")
    }
    
    func noButtonPress(){
        self.navigationController?.pushViewController(CalendarViewController(), animated: true)
    }
    
    func yesButtonPress(){
        tzView.firstDialogStackView.isHidden = false
        tzView.secondDiaologStackView.isHidden = true
    }
    
    func okButtonPress(){
        self.navigationController?.pushViewController(CalendarViewController(), animated: true)
    }
    
}
