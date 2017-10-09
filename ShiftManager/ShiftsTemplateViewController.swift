//
//  ShiftsTemplateViewController.swift
//  ShiftManager
//
//  Created by Jiří Tomis on 09.10.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class ShiftsTemplateViewController: UIViewController {
    
    let shiftsTemplateView = ShiftsTemplateView()
    
    override func loadView() {
        view = shiftsTemplateView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bcg")
        self.view.insertSubview(backgroundImage, at: 0)
        
        setup()
    }
    
    fileprivate func setup() {
        shiftsTemplateView.navigationBar.setBackButton(self, action: #selector(backButtonDidPress))
        
    }
    
    @objc func backButtonDidPress(){
        _ = navigationController?.popViewController(animated: true)
    }
}
