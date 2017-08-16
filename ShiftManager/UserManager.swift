//
//  RegisterManager.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 09.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    
    let defaults = UserDefaults.standard
    private var users = [UserModel]()
    let usersKey = "usersKey"
    var selectedUser: UserModel? {
        didSet {
            // post notification - selectedUserChanged
        }
    }
    
    static let sharedInstance = UserManager()
    
    private override init() {
        super.init()
        loadUsersFromUserDefaults()
        selectDefaultUser()
    }
    
     private func saveUsersToPersistentStorage() {
        let usersAsData = users.map { (user) -> Data in
            NSKeyedArchiver.archivedData(withRootObject: user)
        }
        defaults.set(usersAsData, forKey: usersKey)
        defaults.synchronize()
    }
    
    private func loadUsersFromUserDefaults() {
        var usersArray = [UserModel]()
        if let userModelsAsData = defaults.object(forKey: usersKey) as? [Data] {
            userModelsAsData.forEach({ userModelData in
                usersArray.append(NSKeyedUnarchiver.unarchiveObject(with:userModelData) as! UserModel)
            })
        }
        users = usersArray
    }
    
    public func saveUser(user: UserModel) {
        if user.uniqueID.isEmpty {
            addNewUser(user: user)
            selectNewUser()
        } else {
            update(User: user)
        }
    }
    
    func addNewUser(user: UserModel) {
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
    
    private func selectDefaultUser() {
        if users.count > 0 {
            self.selectedUser = users[0]
        } else {
            self.selectedUser = nil
        }
    }
    
    private func selectNewUser() {
        if users.count > 0 {
            self.selectedUser = users[users.count-1]
        } else {
            self.selectedUser = nil
        }
    }
    
//    func isUserRegistered() -> Bool {
//        return true
//    }
}
