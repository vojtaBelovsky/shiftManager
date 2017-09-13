//
//  CalendarDataSource.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import AFDateHelper

final class CalendarDataSource: NSObject, UICollectionViewDataSource {
    
    fileprivate var numberOfEmptyCells: [Int] = []
    fileprivate let numberOfMonthsInCalendar = 12
    
    var today: Date {
        return Date()
    }
    
    override init() {
        super.init()
        
        for index in 0...numberOfMonthsInCalendar {
            let adjustedDate = today.adjust(.month, offset: index)
            numberOfEmptyCells.append(numberOfEmptyDays(date: adjustedDate))
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfMonthsInCalendar
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dateMonth = today.component(.month) ?? 0
        let adjustedDate = today.adjust(hour: nil, minute: nil, second: nil, day: 1, month: dateMonth+section)
        
        return adjustedDate.numberOfDaysInMonth() + numberOfEmptyCells[section]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let numberOfEmptyCellsForSection = numberOfEmptyCells[indexPath.section]
        
        if numberOfEmptyCellsForSection > indexPath.row {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: CalendarEmtpyCollectionViewCell.self), for: indexPath)
                as? CalendarEmtpyCollectionViewCell
                else {
                    assertionFailure("Non existing cell")
                    return UICollectionViewCell()
            }
            cell.isUserInteractionEnabled = false
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: String(describing: CalendarCollectionViewCell.self), for: indexPath)
                as? CalendarCollectionViewCell
                else {
                    assertionFailure("Non existing cell")
                    return UICollectionViewCell()
            }
            cell.setDefaultStateToLabels()
            
            let dateOfCell = getDateForCell(at: indexPath)?.normalizedDate()
            cell.setDate(date: dateOfCell)
            
            guard let date = dateOfCell else {
                cell.setup(with: nil)
                return cell
            }
            if let shiftForDate = UserManager.sharedInstance.shiftForDate(date),
                let extraShifts = UserManager.sharedInstance.selectedUser?.editCalendarDays[date] {
                cell.setup(with: shiftForDate)
                cell.setupHoliday(with: extraShifts)

            } else if let shiftForDate = UserManager.sharedInstance.shiftForDate(date) {
                cell.setup(with: shiftForDate)
               
            } else if let extraShifts = UserManager.sharedInstance.selectedUser?.editCalendarDays[date] {
                cell.setupHoliday(with: extraShifts)
                
            } else {
                cell.setup(with: nil)
            }
            if date.normalizedDate() == Date().normalizedDate() {
                cell.setupCurrentDay()
            }
            return cell
        }
    }
    
    fileprivate func numberOfEmptyDays(date: Date) -> Int {
        return NSCalendar.current.component(.weekday, from: date.dateFor(.startOfMonth)) - 1
    }
    
    static func Shift(_ shift: ShiftModel) {
        func since(_ date:Date, in component:DateComponentType) -> Int64 {
            return date.since(shift.firstDateOfShift!, in: .day)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: String(describing: CalendarHeaderView.self),
            for: indexPath
        ) as? CalendarHeaderView else {
            assertionFailure("Cannot deque CalendarHeaderView header")
            return UICollectionReusableView()
        }
        headerView.setDefaultStateToMonth()
        
        var date = Date()
        date = date.adjust(.month, offset: indexPath.section)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        
        if let monthOrder = date.component(.month) {
            let monthName = DateFormatter().shortMonthSymbols[monthOrder - 1]
            headerView.setMonthName(name: monthName)
        }
        if date.normalizedDate() == Date().normalizedDate() {
            headerView.setCurrentMonth()
        }
        
        return headerView
    }
}

extension CalendarDataSource {
    func getDateForCell(at indexPath: IndexPath) -> Date? {
        let dayIndex = indexPath.row - numberOfEmptyCells[indexPath.section] + 1
        let monthIndex = ((today.component(.month) ?? 0) + indexPath.section)
        
        var components = DateComponents()
        components.year = today.component(.year)
        components.month = monthIndex
        components.day = dayIndex

        return Calendar(identifier: .gregorian).date(from: components)
    }
}
