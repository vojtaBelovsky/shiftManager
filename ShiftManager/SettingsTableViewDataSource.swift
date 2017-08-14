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

        let shiftModel = ShiftManager.sharedInstance.shiftForIndex(indexPath.row)
        let viewModel = SettingsCellViewModel(title: "Směna \(shiftModel.name)")
        cell.setupCell(viewModel: viewModel)
        return cell
        
    }
   
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            ShiftManager.sharedInstance.deleteShift(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShiftManager.sharedInstance.numberOfShifts()
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

}
