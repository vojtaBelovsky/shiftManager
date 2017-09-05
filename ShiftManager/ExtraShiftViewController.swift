//
//  ExtraShiftViewController.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

protocol ExtraShiftViewControllerDelegate: class {
    func setExtraShifts(extraShifts: [ShiftModel])
}

final class ExtraShiftViewController: UIViewController {

    fileprivate let extraShiftView = ExtraShiftView()
    
    public weak var delegate: ExtraShiftViewControllerDelegate?
    
    fileprivate let date: Date
    fileprivate let dataSource: ExtraShiftDataSource
    
    init(date: Date) {
        self.date = date
        dataSource = ExtraShiftDataSource(date: date)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = NSLocalizedString("EditCallendarDayViewTitle_loc002", comment: "")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonDidPress))
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        extraShiftView.tableView.dataSource = dataSource
    }
    
    override func loadView() {
        view = extraShiftView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for indexPath in dataSource.preselectedIndexPaths {
            extraShiftView.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
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
