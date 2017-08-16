//
//  ExtraShiftDataSource.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class ExtraShiftDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: ShiftTableViewCell.self), for: indexPath)
        as? ShiftTableViewCell
        else {
            assertionFailure("Non existing cell")
            return UITableViewCell()
        }
        
        let shiftModel = UserManager.sharedInstance.shiftForIndex(indexPath.row)
        let formatString = String(format: NSLocalizedString("GeneralShiftName_loc001", comment: ""), shiftModel?.name ?? "", shiftModel?.shortcut ?? "")
        let viewModel = ShiftViewModel(title: formatString)
        cell.setup(with: viewModel)

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserManager.sharedInstance.numberOfShifts()
    }
}
