//
//  EditCallendarDayViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 08.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class EditCallendarDayViewController: UIViewController {
    
    let editCallendarDayView = EditCallendarDayView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = editCallendarDayView
        title = NSLocalizedString("EditCallendarDayViewTitle", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonDidPress))
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.editCallendarDayView.setActionForShiftButton(self, action: #selector(setActionForShiftButton))
    }

    func saveButtonDidPress() {
        navigationController?.popViewController(animated:true)
    }
    
    func setActionForShiftButton(){
        navigationController?.pushViewController(EditDayViewControllerForShifts(), animated: true)
    }
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
