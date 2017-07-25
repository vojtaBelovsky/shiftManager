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
        
        if shift.uniqueID == 0 {
            shift.uniqueID = newShiftID(Shift: shift)
            
            if let shiftsArray = defaults.object(forKey: shiftsKey) as? [Data] {
                var newArray: [Data] = []
                newArray.append(contentsOf: shiftsArray)
                newArray.append(NSKeyedArchiver.archivedData(withRootObject: shift))
                defaults.set(shiftsArray, forKey: shiftsKey)
                
            } else {
                let shiftsArray = [NSKeyedArchiver.archivedData(withRootObject: shift)]
                defaults.set(shiftsArray, forKey: shiftsKey)
            }
            defaults.synchronize()
        } else {
            update(Shift: shift)
        }
    }
    
   public func getShifts() -> [ShiftModel] {
        let shiftModelsAsData = defaults.object(forKey: shiftsKey) as? [Data]
        let shifts = [ShiftModel]()
        shiftModelsAsData?.forEach({ shiftAsData in
          //            shift -> prevedes na datovy typ ShiftModel -> pridas do pole shifts
        })
        return shifts
    }
        // public func getShifts() -> [ShiftModel] {
        // ziskas pole sichet a vratis ( z user defaults ziskas pole [Data], pres
        // for cyklus prevedes objekty Data na ShiftModel, ulozis do pomocneho pole
        // a to vratis
        // }
    
    public func update(Shift: ShiftModel) {
        // updatnes model sichty ( to se bude volat pri editaci sichty )
        
    }
    
    private func newShiftID(Shift: ShiftModel) -> Int {
        if Shift.uniqueID != 0 {

        }
        return 0
    }
}
