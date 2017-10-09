//
//  TemplatesViewController.swift
//  ShiftManager
//
//  Created by Jiří Tomis on 06.10.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class TemplatesViewController: UIViewController {
    
    fileprivate let templatesView = TemplatesView()
    fileprivate let dataSource = TemplatesTableViewDataSource()
    
    override func loadView() {
        view = templatesView
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
        templatesView.navigationBar.setBackButton(self, action: #selector(backButtonDidPress))
        
        templatesView.tableView.dataSource = dataSource
    }
    
    @objc func backButtonDidPress(){
        _ = navigationController?.popViewController(animated: true)
    }
}

extension TemplatesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
