//
//  ShiftManager.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 19.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//


/*
import UIKit

final class ShiftManager: NSObject {


    fileprivate let defaults = UserDefaults.standard
    fileprivate var shifts = [ShiftModel]()
    static let sharedInstance = ShiftManager()
    
    private override init() {
        super.init()
        loadShiftsFromUserDefaults()
    }
    
    deinit {
        saveShiftsToPersistentStorage()
    }
    
    fileprivate func saveShiftsToPersistentStorage() {
        let shiftsAsData = shifts.map { (shift) -> Data in
            NSKeyedArchiver.archivedData(withRootObject: shift)
        }
            defaults.set(shiftsAsData, forKey: shiftsKey)
        defaults.synchronize()
    }
    
    fileprivate func loadShiftsFromUserDefaults() {
        var shiftsArray = [ShiftModel]()
        if let shiftModelsAsData = defaults.object(forKey: shiftsKey) as? [Data] {
            shiftModelsAsData.forEach({ shiftModelData in
                shiftsArray.append(NSKeyedUnarchiver.unarchiveObject(with:shiftModelData) as! ShiftModel)
            })
        }
        shifts = shiftsArray
    }
}
*/
