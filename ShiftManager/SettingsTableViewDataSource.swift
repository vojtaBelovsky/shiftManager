//
//  SettingsTableViewDataSource.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 13/07/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class SettingsTableViewDataSource: NSObject, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: ShiftTableViewCell.self), for: indexPath)
        as? ShiftTableViewCell else {
            assertionFailure("Non existing cell")
            return UITableViewCell()
        }

<<<<<<< HEAD
        let shiftModel = ShiftManager.sharedInstance.shiftForIndex(indexPath.row)
        let formatString = String(format: NSLocalizedString("GeneralShiftName_loc001", comment: ""), shiftModel.name, (shiftModel.shortcut))
=======
        let shiftModel = UserManager.sharedInstance.shiftForIndex(indexPath.row)
        // \(shiftModel.name) (\(shiftModel.shortcut))
        let formatString = String(format: NSLocalizedString("GeneralShiftName_loc001", comment: ""), shiftModel.name, shiftModel.shortcut)
>>>>>>> 9b946ce58acbf13c9986955aba98bce9ac1fd98e
        let viewModel = ShiftViewModel(title: formatString)
        cell.setup(with: viewModel)

        return cell
    }
   
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            UserManager.sharedInstance.deleteShift(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserManager.sharedInstance.numberOfShifts()
    }
}
