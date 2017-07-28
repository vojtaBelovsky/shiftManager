//
//  Shift.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 19.07.17.
//  Copyright © 2017 Krystian Raszka. All rights reserved.
//
import Foundation
import UIKit

class ShiftModel: NSObject, NSCoding {
    
    var uniqueID: String = ""
    var name: String = ""
    var interval: Int = 1
    var date: Date?
    var color: UIColor?
    
    fileprivate let namePropertyKey = "namePropertyKey"
    fileprivate let intervalPropertyKey = "intervalPropertyKey"
    fileprivate let datePropertyKey = "datePropertyKey"
    fileprivate let colorPropertyKey = "colorPropertyKey"
    fileprivate let shiftIDKey = "shiftIDKey"

    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        if let name = aDecoder.decodeObject(forKey: namePropertyKey) as? String {
            self.name = name
        }
        
        if let interval = aDecoder.decodeObject(forKey: intervalPropertyKey) as? Int {
            self.interval = interval
        }
        
        if let date = aDecoder.decodeObject(forKey: datePropertyKey) as? Date {
            self.date = date
        }
        
        if let shiftID = aDecoder.decodeObject(forKey: shiftIDKey) as? String {
            self.uniqueID = shiftID
        }
        
        if let color = aDecoder.decodeObject(forKey: colorPropertyKey) as? UIColor {
            self.color = color
        }
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: namePropertyKey)
        
        if let date = self.date{
            aCoder.encode(date, forKey: datePropertyKey)
        }

        aCoder.encode(interval, forKey: intervalPropertyKey)
        
        aCoder.encode(uniqueID, forKey: shiftIDKey)

        if let color = self.color {
            aCoder.encode(color, forKey: colorPropertyKey)
        }
    }
}
