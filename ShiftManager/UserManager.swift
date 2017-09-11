//
//  RegisterManager.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 09.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import AFDateHelper
import PureLayout

final class UserManager: NSObject {
    
    fileprivate let defaults = UserDefaults.standard
    fileprivate var users = [UserModel]()
    fileprivate let usersKey = "usersKey"
    var maximumDate: Date?
    var selectedUser: UserModel? {
        didSet {
        }
    }
    
        
    static let sharedInstance = UserManager()

    fileprivate override init() {
        super.init()
        loadUsersFromUserDefaults()
        selectDefaultUser()
    }
    
    fileprivate func saveUsersToPersistentStorage() {
        let usersAsData = users.map { (user) -> Data in
            NSKeyedArchiver.archivedData(withRootObject: user)
        }
        defaults.set(usersAsData, forKey: usersKey)
        defaults.synchronize()
    }
    
    fileprivate func loadUsersFromUserDefaults() {
        var usersArray = [UserModel]()
        if let userModelsAsData = defaults.object(forKey: usersKey) as? [Data] {
            userModelsAsData.forEach({ userModelData in
                usersArray.append(NSKeyedUnarchiver.unarchiveObject(with:userModelData) as! UserModel)
            })
        }
        users = usersArray
    }
    
    fileprivate func selectDefaultUser() {
        selectedUser =  users.count > 0 ? users[0] : nil
    }
    
    fileprivate func selectNewUser() {
        selectedUser = users.count > 0 ? users[users.count-1] : nil
    }
}

// MARK: UserManager
extension UserManager {
    public func saveUser(user: UserModel) {
        if user.uniqueID.isEmpty {
            addNewUser(user: user)
            selectNewUser()
        } else {
            update(User: user)
        }
    }
    
    public func addNewUser(user: UserModel) {
        user.uniqueID = UUID().uuidString
        users.append(user)
        saveUsersToPersistentStorage()
    }
    
    public func update(User: UserModel) {
        saveUsersToPersistentStorage()
    }
    
    public func deleteUser(at index: Int) {
        users.remove(at: index)
        selectDefaultUser()
        saveUsersToPersistentStorage()
    }
    
    public func deleteSelectedUser() {
        guard let user = selectedUser, let index = users.index(of: user) else { return }
        deleteUser(at: index)
    }
    
    public func getUsers() -> [UserModel] {
        return users
    }
    
    public func numberOfUsers() -> Int {
        return users.count
    }
    
    public func userForIndex(_ index: Int) -> UserModel {
        return users[index]
    }
    
    public func selectedUserIndex() -> Int? {
        guard let user = selectedUser else {
            return nil
        }
        return users.index(of: user)
    }
}

// MARK: Shift manament
extension UserManager {
    public func saveShift(shift: ShiftModel) {
        shift.uniqueID.isEmpty ? addNewShift(shift: shift) : update()
        saveUsersToPersistentStorage()
        shiftForDateDictionaryShouldReloadData()
    }

    public func addNewShift(shift: ShiftModel) {
        shift.uniqueID = UUID().uuidString
        selectedUser?.shifts.append(shift)
    }

    public func update() {
        //TODO: Not implemented in this version
    }

    public func deleteShift(at index: Int) {
        selectedUser?.shifts.remove(at: index)
        NotificationCenter.default.post(name: reloadCalendarView, object: nil)
        saveUsersToPersistentStorage()
    }

    public func numberOfShifts() -> Int {
        return selectedUser?.shifts.count ?? 0
    }

    public func shiftForIndex(_ index: Int) -> ShiftModel? {
        return selectedUser?.shifts[index]
    }
    
    public func getMaxDate() -> Date {
        if maximumDate == nil {
            maximumDate = Date().adjust(.year, offset: 1)
        }
        return maximumDate!
    }
    
    public func shiftForDate(_ date: Date) -> ShiftModel? {
        
        if selectedUser?.shouldGenerateShiftForDateDictionary ?? false {
            selectedUser?.generateShiftForDateDictionary()
            selectedUser?.shouldGenerateShiftForDateDictionary = false
        }

        return selectedUser?.shiftForDateDictionary[date]
    }
    
    public func shiftForDateDictionaryShouldReloadData() {
        selectedUser?.resetShiftForDateDictionary()
        selectedUser?.shouldGenerateShiftForDateDictionary = true
    }
}

// MARK: EditCalendarDay managment
extension UserManager {
    public func saveEditCalendarDayModel(_ editCalendarDay: EditCalendarDayModel) {
        guard let selectedUser = selectedUser, let date = editCalendarDay.date else { return }
        selectedUser.editCalendarDays[date] = editCalendarDay
        saveUsersToPersistentStorage()
    }
}
