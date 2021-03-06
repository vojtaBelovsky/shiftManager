//
//  EditShiftViewController.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 01/08/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

final class EditShiftViewController: NewShiftViewController {
    
    init(shift: ShiftModel) {
        super.init(nibName: nil, bundle: nil)
        self.shift = shift
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        newShiftView.navigationBar.setTitle(NSLocalizedString("CreateNewShift_loc009", comment: ""))
        setupView()
        newShiftView.renameButton()
    }
    
    fileprivate func setupView() {
        newShiftView.setupView(with: shift)
    }
}
