//
//  RegisterManager.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 09.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class UserManager: NSObject {
    
    fileprivate let defaults = UserDefaults.standard
    fileprivate  var users = [UserModel]()
    fileprivate let usersKey = "usersKey"
    var selectedUser: UserModel? {
        didSet {
            // post notification - selectedUserChanged
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
