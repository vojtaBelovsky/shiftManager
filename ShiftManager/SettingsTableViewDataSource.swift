//
//  SettingsTableViewDataSource.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 13/07/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class SettingsTableViewDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: settingsTableViewCellReuseIdentifier, for: indexPath)
            as? SettingsTableViewCell
            else {
                assertionFailure("Non existing cell")
                return UITableViewCell()
        }

        let viewModel = SettingsCellViewModel (
            title: "Směna \(indexPath.row)"
            //          title: "Section \(indexPath.section) Row \(indexPath.row)", color: .red
        )
        cell.setupCell(viewModel: viewModel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
