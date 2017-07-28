//
//  ShiftManager.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 19.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class ShiftManager: NSObject {
    
    let defaults = UserDefaults.standard
    private var shifts = [ShiftModel]()
    let shiftsKey = "shiftsKey"
    
    static let sharedInstance = ShiftManager()
    
    private override init() {
        super.init()
        self.loadShiftsFromUserDefaults()
    }
    
    private func loadShiftsFromUserDefaults() {
        var shiftsArray = [ShiftModel]()
        if let shiftModelsAsData = defaults.object(forKey: shiftsKey) as? [Data] {
            shiftModelsAsData.forEach({ shiftModelData in
                shiftsArray.append(NSKeyedUnarchiver.unarchiveObject(with:shiftModelData) as! ShiftModel)
            })
        }
        shifts = shiftsArray
    }
    
    public func saveShift(shift: ShiftModel) {
        if shift.uniqueID.isEmpty {
            addNewShift(shift: shift)
        } else {
            update(Shift: shift)
        }
        
    }
    
    func addNewShift(shift: ShiftModel) {
        shifts.append(shift)
        let shiftsAsData = shifts.map { (shift) -> Data in
            NSKeyedArchiver.archivedData(withRootObject: shift)
        }
        defaults.set(shiftsAsData, forKey: shiftsKey)
        defaults.synchronize()
    }
    
    public func update(Shift: ShiftModel) {
        // updatnes model sichty ( to se bude volat pri editaci sichty )
    }
    
    public func getShifts() -> [ShiftModel] {
        return shifts
    }
    
    public func numberOfShifts() -> Int {
        return shifts.count
    }
    
    public func shiftFor(IndexPath: IndexPath) -> ShiftModel {
        return shifts[IndexPath.row]
    }
}

