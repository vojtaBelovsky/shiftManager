//
//  Shift.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 19.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//


// interval
// date
// barva


import Foundation
import UIKit

class ShiftModel: NSObject, NSCoding {
    
    var shifID : Int = 0
    var name : String?
    var interval : Int = 0
    var date : Date?
    var color : UIColor?
    
    fileprivate let namePropertyKey = "namePropertyKey"
    fileprivate let intervalPropertyKey = "intervalPropertyKey"
    fileprivate let DatePropertyKey = "DatePropertyKey"
    fileprivate let ColorPropertyKey = "ColorPropertyKey"

    
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
        
        func encode() -> Data {
            return NSKeyedArchiver.archivedData(withRootObject: self)
        }
    }

        

    func encode(with aCoder: NSCoder) {
        if let name = self.name {
            aCoder.encode(name, forKey: namePropertyKey)
        }
        
        /*
        if let interval = self.interval {
            aCoder.encode(interval, forKey: intervalPropertyKey)
        }
        */
        
        if let date = self.date{
            aCoder.encode(date, forKey: DatePropertyKey)
        }
        
        func color(withData data:Data) -> UIColor {
            return NSKeyedUnarchiver.unarchiveObject(with: data) as! UIColor
        }
       

        
    }
}
