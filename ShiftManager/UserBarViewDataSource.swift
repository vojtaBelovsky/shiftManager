//
//  UserBarViewDataSource.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 15.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class UserBarViewDataSource: NSObject {
    
    func getDefaultUser() -> UserModel? {
        if UserManager.sharedInstance.getUsers().count > 0 {
            return UserManager.sharedInstance.getUsers()[0]
        } else {
            return nil
        }
    }
}

extension UserBarViewDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return UserManager.sharedInstance.getUsers().count
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
