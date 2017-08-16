//
//  ExtraShiftViewController.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class ExtraShiftViewController: UIViewController {

    fileprivate let extraShiftView = ExtraShiftView()
    fileprivate let dataSource = ExtraShiftDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        extraShiftView.tableView.dataSource = dataSource
    }
    
    override func loadView() {
        view = extraShiftView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
