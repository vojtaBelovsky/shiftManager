//
//  EditCallendarDayViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 08.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class EditCallendarDayViewController: UIViewController {
    
    fileprivate let editCallendarDayView: EditCallendarDayView
    
    init(with day: Date) {
        editCallendarDayView = EditCallendarDayView(with: day)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("EditCallendarDayViewTitle_loc001", comment: "")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonDidPress))
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        editCallendarDayView.setActionForShiftButton(self, action: #selector(setActionForShiftButton))
    }
    
    override func loadView() {
        view = editCallendarDayView
    }

    func saveButtonDidPress() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func setActionForShiftButton() {
        navigationController?.pushViewController(ExtraShiftViewController(), animated: true)
    }
}
