//
//  EditCalendarDayModel.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 16.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import Foundation
import UIKit

final class EditCalendarDayModel: NSObject, NSCoding, NSCopying {

    var freeDay: Bool = false
    var extraShifts: [ShiftModel] = []
    var note: String = ""
    var date: Date?
    
    fileprivate let freeDayPropertyKey = "freeDayPropertyKey"
    fileprivate let extraShiftPropertyKey = "extraShiftPropertyKey"
    fileprivate let notePropertyKey = "notePropertyKey"
    fileprivate let datePropertyKey = "datePropertyKey"
    
    override init() {
        super.init()
    }
    
    init(freeDay: Bool, extraShifts: [ShiftModel], note: String, date: Date?) {
        self.freeDay = freeDay
        self.extraShifts = extraShifts.flatMap { $0.copy() as? ShiftModel }
        self.note = note
        self.date = date
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = EditCalendarDayModel(freeDay: freeDay, extraShifts: extraShifts, note: note, date: date)
        return copy
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.freeDay = aDecoder.decodeBool(forKey: freeDayPropertyKey)
        
        if let extraShifts = aDecoder.decodeObject(forKey: extraShiftPropertyKey) as? Array<ShiftModel> {
            self.extraShifts = extraShifts
        }
        
        if let note = aDecoder.decodeObject(forKey: notePropertyKey) as? String {
            self.note = note
        }
        
        if let date = aDecoder.decodeObject(forKey: datePropertyKey) as? Date {
            self.date = date
        }
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(freeDay as Bool, forKey: freeDayPropertyKey)
        aCoder.encode(extraShifts, forKey: extraShiftPropertyKey)
        aCoder.encode(note, forKey: notePropertyKey)
        
        if let date = self.date{
            aCoder.encode(date, forKey: datePropertyKey)
        }        
    }
}
