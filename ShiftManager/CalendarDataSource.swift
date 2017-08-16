//
//  CalendarDataSource.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import AFDateHelper

final class CalendarDataSource: NSObject, UICollectionViewDataSource {
    
    fileprivate var numberOfEmptyCells: [Int] = []
    fileprivate let numberOfMonthsInCalendar = 24
    
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
                withReuseIdentifier: String(describing: CalendarEmtpyCollectionViewCell.self), for: indexPath)
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
    }
    
    func numberOfEmptyDays(date: Date) -> Int {
        return NSCalendar.current.component(.weekday, from: date.dateFor(.startOfMonth)) - 1
    }
    
    static func Shift(_ shift: ShiftModel) {
        func since(_ date:Date, in component:DateComponentType) -> Int64 {
            return date.since(shift.date!, in: .day)
        }
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
