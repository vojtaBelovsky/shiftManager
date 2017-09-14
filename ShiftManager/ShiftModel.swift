//
//  Shift.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 19.07.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import Foundation
import UIKit

final class ShiftModel: NSObject, NSCoding, NSCopying {
    
    var uniqueID: String = ""
    var name: String = ""
    var shortcut: String = ""
    var interval: Int!
    var firstDateOfShift: Date?
    var color: UIColor?
    
    fileprivate let namePropertyKey = "namePropertyKey"
    fileprivate let shortcutPropertyKey = "shortcutPropertyKey"
    fileprivate let intervalPropertyKey = "intervalPropertyKey"
    fileprivate let datePropertyKey = "datePropertyKey"
    fileprivate let colorPropertyKey = "colorPropertyKey"
    fileprivate let shiftIDKey = "shiftIDKey"
    
    init(uniqueID: String, name: String, shortcut: String, interval: Int, firstDateOfShift: Date?, color: UIColor?) {
        self.uniqueID = uniqueID
        self.name = name
        self.shortcut = shortcut
        self.interval = interval
        self.firstDateOfShift = firstDateOfShift
        self.color = color
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = ShiftModel(uniqueID: uniqueID, name: name, shortcut: shortcut, interval: interval, firstDateOfShift: firstDateOfShift, color: color)
        return copy
    }

    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        if let name = aDecoder.decodeObject(forKey: namePropertyKey) as? String {
            self.name = name
        }
        
        if let shortcut = aDecoder.decodeObject(forKey: shortcutPropertyKey) as? String {
            self.shortcut = shortcut
        }
        
        if let interval = aDecoder.decodeObject(forKey: intervalPropertyKey) as? Int {
            self.interval = interval
        }
        
        if let date = aDecoder.decodeObject(forKey: datePropertyKey) as? Date {
            self.firstDateOfShift = date
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
        aCoder.encode(shortcut, forKey: shortcutPropertyKey)
        
        if let date = self.firstDateOfShift {
            aCoder.encode(date, forKey: datePropertyKey)
        }

        aCoder.encode(interval, forKey: intervalPropertyKey)
        
        aCoder.encode(uniqueID, forKey: shiftIDKey)

        if let color = self.color {
            aCoder.encode(color, forKey: colorPropertyKey)
        }
    }

    override func isEqual(_ object: Any?) -> Bool {
        if let other = object as? ShiftModel {
            return self.uniqueID == other.uniqueID &&
                self.name == other.name &&
                self.shortcut == other.shortcut &&
                self.interval == other.interval &&
                self.firstDateOfShift == other.firstDateOfShift &&
                self.color == other.color
        } else {
            return false
        }
    }
}
