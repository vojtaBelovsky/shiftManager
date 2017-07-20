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
        /*
        var shiftsArray = defaults.object(forKey: shiftsKey) as? [Data]
        if shiftsArray != nil {
            shiftsArray!.append(NSKeyedArchiver.archivedData(withRootObject: shift))
    */
        if let shiftsArray = defaults.object(forKey: shiftsKey) as? [Data] {
            var newArray: [Data] = []
            newArray.append(contentsOf: shiftsArray)
            newArray.append(NSKeyedArchiver.archivedData(withRootObject: shift))
            defaults.set(shiftsArray, forKey: shiftsKey)

        } else {
            let shiftsArray = [NSKeyedArchiver.archivedData(withRootObject: shift)]
            defaults.set(shiftsArray, forKey: shiftsKey)

        }
        defaults.set(NSKeyedArchiver.archivedData(withRootObject: shift), forKey:shiftsKey)
    }
}