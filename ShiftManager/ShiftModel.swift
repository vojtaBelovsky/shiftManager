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
    
    var shiftID : Int = 1
    var name : String?
    var interval : Int = 1
    var date : Date?
    var color : UIColor?
    
    fileprivate let namePropertyKey = "namePropertyKey"
    fileprivate let intervalPropertyKey = "intervalPropertyKey"
    fileprivate let DatePropertyKey = "DatePropertyKey"
    fileprivate let ColorPropertyKey = "ColorPropertyKey"
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
        
        if let date = aDecoder.decodeObject(forKey: DatePropertyKey) as? Date {
            self.date = date
        }
        
        if let shiftID = aDecoder.decodeObject(forKey: shiftIDKey) as? Int {
            self.shiftID = shiftID
        }
        
        func encode() -> Data {
            return NSKeyedArchiver.archivedData(withRootObject: self)
        }
    }

        

    func encode(with aCoder: NSCoder) {
        if let name = self.name {
            aCoder.encode(name, forKey: namePropertyKey)
        }
        
        if let date = self.date{
            aCoder.encode(date, forKey: DatePropertyKey)
        }
/*
        
        if var interval = self.interval {
            aCoder.encode(interval, forKey: intervalPropertyKey)
        }
        
        if var shiftID = self.shiftID {
            aCoder.encode(shiftID, forKey: shiftIDKey)
        }
 */
        
        func color(withData data:Data) -> UIColor {
            return NSKeyedUnarchiver.unarchiveObject(with: data) as! UIColor
        }
    }
}
