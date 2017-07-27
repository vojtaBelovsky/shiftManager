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
    
    let shiftsKey = "shiftsKey"
    
    override init() {
        super.init()
    }
    
    public func saveShift(shift: ShiftModel) {
        
        if let shiftsArray = defaults.object(forKey: shiftsKey) as? [Data] {
            var newArray: [Data] = []
            newArray.append(contentsOf: shiftsArray)
            newArray.append(NSKeyedArchiver.archivedData(withRootObject: shift))
            defaults.set(newArray, forKey: shiftsKey)
            
        } else {
            let shiftsArray = [NSKeyedArchiver.archivedData(withRootObject: shift)]
            defaults.set(shiftsArray, forKey: shiftsKey)
        }
        defaults.synchronize()
    }
    
    public func getShifts() -> [ShiftModel] {
        var shiftsArray = [ShiftModel]()
        if let shiftModelsAsData = defaults.object(forKey: shiftsKey) as? [Data] {
            shiftModelsAsData.forEach({ shiftModelData in
                shiftsArray.append(NSKeyedUnarchiver.unarchiveObject(with:shiftModelData) as! ShiftModel)
            })
        }
        return shiftsArray
    }
    
    public func update(Shift: ShiftModel) {
        // updatnes model sichty ( to se bude volat pri editaci sichty )
        
    }
    
    
}

