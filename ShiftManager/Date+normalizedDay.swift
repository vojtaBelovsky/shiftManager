//
//  Date+normalizedDay.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 28/08/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import Foundation

extension Date {
    
    public func normalizedDate() -> Date {
        
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.year, .month, .day], from: self)
        
        return calendar.date(from: components)!
    }
    
    public func normalizedTime() -> Date {
        
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components([.hour, .minute, .second], from: self)
        
        return calendar.date(from: components)!
    }
}

public func == (lhs: Date, rhs: Date) -> Bool {
    return lhs.timeIntervalSince1970 == rhs.timeIntervalSince1970 || lhs.compare(rhs) == .orderedSame
}

public func < (lhs: Date, rhs: Date) -> Bool {
    return lhs.compare(rhs) == .orderedAscending
}
