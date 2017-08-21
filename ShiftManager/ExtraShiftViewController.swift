//
//  ExtraShiftViewController.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

protocol ExtraShiftViewControllerDelegate: class {
    func setExtraShifts(extraShifts: [ShiftModel])
}

final class ExtraShiftViewController: UIViewController {

    fileprivate let extraShiftView = ExtraShiftView()
    fileprivate let dataSource = ExtraShiftDataSource()
    
    public weak var delegate: ExtraShiftViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("EditCallendarDayViewTitle_loc002", comment: "")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidPress))
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        extraShiftView.tableView.dataSource = dataSource
        extraShiftView.tableView.allowsMultipleSelectionDuringEditing = true
        extraShiftView.tableView.isEditing = true
    }
    
    override func loadView() {
        view = extraShiftView
    }
    
    func doneButtonDidPress(){
        let extraShifts = extraShiftView.tableView.indexPathsForSelectedRows?.flatMap {
            UserManager.sharedInstance.shiftForIndex($0.row)
        }

        delegate?.setExtraShifts(extraShifts: extraShifts ?? [])
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
