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
    
    fileprivate let date: Date
    
    fileprivate var extraShiftsForDate: EditCalendarDayModel? {
        return UserManager.sharedInstance.selectedUser?.editCalendarDays[date]
    }
    
    init(date: Date) {
        self.date = date
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
        
        let shiftModel = UserManager.sharedInstance.shiftForIndex(indexPath.row)
        cell.setup(with: shiftModel)
        
        if let model = shiftModel, extraShiftsForDate?.extraShifts.contains(model) ?? false {
            preselectedIndexPaths.append(indexPath)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserManager.sharedInstance.numberOfShifts()
    }
}
