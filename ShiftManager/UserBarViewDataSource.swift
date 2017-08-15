//
//  UserBarViewDataSource.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 15.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class UserBarViewDataSource: NSObject {
    
    fileprivate let users: [UserModel]
    
    override init() {
        self.users = UserManager.sharedInstance.getUsers()
        super.init()
    }
}

extension UserBarViewDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UserBarCollectionCell.self), for: indexPath)
                as? UserBarCollectionCell
            else {
                assertionFailure("Non existing cell")
                return UICollectionViewCell()
        }
        
        //TODO: Set photo of User
        return cell
    }
}