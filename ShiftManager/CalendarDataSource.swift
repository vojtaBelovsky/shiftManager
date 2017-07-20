//
//  CalendarDataSource.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import AFDateHelper

enum ShiftType{
    case A
    case B
    case C
    case D
}

enum Relay{ //= typeOfShift
    case Morning
    case Afternoon
    case Evening
    case DayOff
    
    case Unknow
}

struct Shift{
   let color: UIColor
  let shiftType: Relay
  //další kraviny
}

var firstMorningShiftOfYear: Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-mm-yyyy"
    
    return dateFormatter.date(from: "01-01-2017")
}

class CalendarDataSource: NSObject, UICollectionViewDataSource {    
    var numberOfEmptyCells: [Int] = []
    let numberOfMonthsInCalendar = 24
    
    var today: Date {
        return Date()
    }
    
    override init() {
        super.init()
        
        for index in 0...numberOfMonthsInCalendar {
            let dateMonth = today.component(.month) ?? 0
            let adjustedDate = today.adjust(hour: nil, minute: nil, second: nil, day: nil, month: dateMonth+index)
            numberOfEmptyCells.append(numberOfEmptyDays(date: adjustedDate))
            
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfMonthsInCalendar
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dateMonth = today.component(.month) ?? 0
        let adjustedDate = today.adjust(hour: nil, minute: nil, second: nil, day: nil, month: dateMonth+section)

        return adjustedDate.numberOfDaysInMonth() + numberOfEmptyCells[section]
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let numberOfEmptyCellsForSection = numberOfEmptyCells[indexPath.section]
        
        _ = today.adjust(
            hour: nil,
            minute: nil,
            second: nil,
            day: (today.component(.day) ?? 0) + indexPath.row - numberOfEmptyCellsForSection,
            month: (today.component(.month) ?? 0) + indexPath.section
        )
        
        if numberOfEmptyCellsForSection > indexPath.row {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: calendarCollectionViewCellEmptyCellCount, for: indexPath)
                as? CalendarEmtpyCollectionViewCell
                else {
                    assertionFailure("Non existing cell")
                    return UICollectionViewCell()
            }
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: calendarCollectionViewCellReuseIdentifier, for: indexPath)
                as? CalendarCollectionViewCell
                else {
                    assertionFailure("Non existing cell")
                    return UICollectionViewCell()
            }
            
            cell.dayLabel.text = "\(indexPath.row - numberOfEmptyCellsForSection + 1)"
            return cell
        }
        
        // jak zjistit den
        // date = Date() => dnešek
        // indexPath.section = měsíc
        // indexPath.row = den
    }
    
    func numberOfEmptyDays(date: Date) -> Int {

        let firstDayOfMonth = date.dateFor(.startOfMonth)
        return NSCalendar.current.component(.weekday, from: firstDayOfMonth) - 1

    }
    
    func everydayRelay(date: Date, shift: ShiftType) -> Shift {
        let daySince = firstMorningShiftOfYear?.days(from: today) ?? 0
        var shiftType: Relay
        var modulo = daySince % 8
        
        switch shift {
        case .A: break
        case .B: modulo -= 2
        case .C: modulo -= 4
        case .D: modulo -= 6
        }
        
        if modulo < 0 { modulo += 8 }
        
        switch modulo {
        case 0,1: shiftType = .Morning
        case 2,3: shiftType = .Afternoon
        case 4,5: shiftType = .Evening
        case 6,7: shiftType = .DayOff
        default :
            shiftType = .Unknow
            assertionFailure("Máš tu špatný den")
        }
        return Shift(color: .red, shiftType: shiftType)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier:CalendarHeaderView.calendarHeaderIdentifier,
            for: indexPath
        ) as? CalendarHeaderView else {
            assertionFailure("Cannot deque CalendarHeaderView header")
            return UICollectionReusableView()
        }
        
        var date = Date()
        date = date.adjust(.month, offset: indexPath.section)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        
        if let monthOrder = date.component(.month) {
            let monthName = DateFormatter().shortMonthSymbols[monthOrder - 1]
            headerView.monthLabel.text = monthName
        }
        
        return headerView
    }
}

extension Date {
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
}



