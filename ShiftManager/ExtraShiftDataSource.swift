//
//  ExtraShiftDataSource.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import AFDateHelper

final class ExtraShiftDataSource: NSObject, UITableViewDataSource {
    
    fileprivate let editCalendarDayModel: EditCalendarDayModel
    
    init(editCalendarDayModel: EditCalendarDayModel) {
        self.editCalendarDayModel = editCalendarDayModel
    }
    
    var preselectedIndexPaths: [IndexPath] = []
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: ExtraShiftTableViewCell.self), for: indexPath)
        as? ExtraShiftTableViewCell
        else {
            assertionFailure("Non existing cell")
            return UITableViewCell()
        }
        
        cell.setup(with: UserManager.sharedInstance.selectedUser?.shifts[indexPath.row])
        
        if let shift = UserManager.sharedInstance.selectedUser?.shifts[indexPath.row], editCalendarDayModel.extraShifts.contains(shift) {
            preselectedIndexPaths.append(indexPath)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserManager.sharedInstance.numberOfShifts()
    }
}
