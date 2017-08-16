//
//  RegisterManager.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 09.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class UserManager: NSObject {
    
            ///////////////////////////////ShiftManager//////////////////////////////////////
    fileprivate let shiftsKey = "shiftsKey"
    fileprivate var shifts = [ShiftModel]()
    
    fileprivate let defaults = UserDefaults.standard
    fileprivate  var users = [UserModel]()
    fileprivate let usersKey = "usersKey"
    var selectedUser: UserModel? {
        didSet {
            // post notification - selectedUserChanged
        }
    }
    
    static let sharedInstance = UserManager()

            ///////////////////////////////ShiftManager//////////////////////////////////////
    fileprivate override init() {
        super.init()
        loadUsersFromUserDefaults()
        selectDefaultUser()
        loadShiftsFromUserDefaults()

    }
    
    deinit {
        saveShiftsToPersistentStorage()
    }
    
    fileprivate func saveShiftsToPersistentStorage() {
        let shiftsAsData = shifts.map { (shift) -> Data in
            NSKeyedArchiver.archivedData(withRootObject: shift)
        }
        defaults.set(shiftsAsData, forKey: shiftsKey)
        defaults.synchronize()
    }
    
    fileprivate func loadShiftsFromUserDefaults() {
        var shiftsArray = [ShiftModel]()
        if let shiftModelsAsData = defaults.object(forKey: shiftsKey) as? [Data] {
            shiftModelsAsData.forEach({ shiftModelData in
                shiftsArray.append(NSKeyedUnarchiver.unarchiveObject(with:shiftModelData) as! ShiftModel)
            })
        }
        shifts = shiftsArray
    }
                ///////////////////////////////EndShiftManager//////////////////////////////////////
    
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
    
    public func getUsers() -> [UserModel] {
        return users
    }
    
    public func numberOfUsers() -> Int {
        return users.count
    }
    
    public func userForIndex(_ index: Int) -> UserModel {
        return users[index]
    }
}

///////////////////////////////ShiftManager//////////////////////////////////////
extension UserManager {
    public func saveShift(shift: ShiftModel) {
        shift.uniqueID.isEmpty ? addNewShift(shift: shift) : update(Shift: shift)
    }

    public func addNewShift(shift: ShiftModel) {
        shift.uniqueID = UUID().uuidString
        shifts.append(shift)
        saveShiftsToPersistentStorage()
    }

    public func update(Shift: ShiftModel) {
        saveShiftsToPersistentStorage()
    }

    public func deleteShift(at index: Int) {
        shifts.remove(at: index)
        saveShiftsToPersistentStorage()
    }

    public func numberOfShifts() -> Int {
        return shifts.count
    }

    public func shiftForIndex(_ index: Int) -> ShiftModel {
        return shifts[index]
    }
}
