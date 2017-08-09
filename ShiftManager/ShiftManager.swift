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
    
    deinit {
        saveShiftsToPersistentStorage()
    }
    
    private func saveShiftsToPersistentStorage() {
        let shiftsAsData = shifts.map { (shift) -> Data in
            NSKeyedArchiver.archivedData(withRootObject: shift)
        }
        defaults.set(shiftsAsData, forKey: shiftsKey)
        defaults.synchronize()
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
        shift.uniqueID = UUID().uuidString
        shifts.append(shift)
        saveShiftsToPersistentStorage()
    }
    
    public func update(Shift: ShiftModel) {
            saveShiftsToPersistentStorage()
    }
    
    public func deleteShift(at index: Int) {
        shifts.remove(at: index)
        saveShiftsToPersistentStorage()
        
    }
    
    public func getShifts() -> [ShiftModel] {
        return shifts
    }
    
    public func numberOfShifts() -> Int {
        return shifts.count
    }
    
    public func shiftForIndex(_ index: Int) -> ShiftModel {
        return shifts[index]
    }
}

