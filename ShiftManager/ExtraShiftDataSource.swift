//
//  ExtraShiftDataSource.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class ExtraShiftDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: ShiftTableViewCell.self), for: indexPath)
        as? ShiftTableViewCell
        else {
            assertionFailure("Non existing cell")
            return UITableViewCell()
        }
        
        let shiftModel = ShiftManager.sharedInstance.shiftForIndex(indexPath.row)
        let viewModel = ShiftViewModel(title: "Směna \(shiftModel.name)")
        cell.extraShiftCell(viewModel: viewModel)

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShiftManager.sharedInstance.numberOfShifts()
    }
}
