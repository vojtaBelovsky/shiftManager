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
            
            cell.setDayLabelTitle(title: "\(indexPath.row - numberOfEmptyCellsForSection + 1)")
            return cell
        }
    }
    
    fileprivate func numberOfEmptyDays(date: Date) -> Int {
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
            withReuseIdentifier: String(describing: CalendarHeaderView.self),
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
            headerView.setMonthName(name: monthName)
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
