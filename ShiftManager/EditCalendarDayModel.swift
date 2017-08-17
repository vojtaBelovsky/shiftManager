//
//  EditCalendarDayModel.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 16.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import Foundation
import UIKit

final class EditCalendarDayModel: NSObject, NSCoding {
    
    var uniqueID: String = ""
    var freeDay : Bool = false
    var extraShifts : [ShiftModel] = []
    var note : String = ""
    
    fileprivate let freeDayPropertyKey = "freeDayPropertyKey"
    fileprivate let extraShiftPropertyKey = "extraShiftPropertyKey"
    fileprivate let notePropertyKey = "notePropertyKey"
    fileprivate let userIDKey = "userIDKey"
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        if let freeDay = aDecoder.decodeObject(forKey: freeDayPropertyKey) as? Bool {
            self.freeDay = freeDay
        }
        
        if let extraShifts = aDecoder.decodeObject(forKey: extraShiftPropertyKey) as? Array<ShiftModel> {
            self.extraShifts = extraShifts
        }
        
        if let note = aDecoder.decodeObject(forKey: notePropertyKey) as? String {
            self.note = note
        }
        
        if let userID = aDecoder.decodeObject(forKey: userIDKey) as? String {
            self.uniqueID = userID
        }

    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(freeDayPropertyKey, forKey: freeDayPropertyKey)
        aCoder.encode(extraShifts, forKey: extraShiftPropertyKey)
        aCoder.encode(note, forKey: notePropertyKey)
        aCoder.encode(uniqueID, forKey: userIDKey)
        
    }
}
