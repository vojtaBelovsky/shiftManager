//
//  UserBarViewDataSource.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 15.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

final class UserBarViewDataSource: NSObject {
    
    let newUserView = NewUserView()
    
    func getDefaultUser() -> UserModel? {
        return UserManager.sharedInstance.getUsers().count > 0 ? UserManager.sharedInstance.getUsers()[0] : nil
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
        if let selectedUserIndex = UserManager.sharedInstance.selectedUserIndex(), selectedUserIndex == indexPath.row  {
            cell.isSelected = true
        } else {
            cell.isSelected = false
        }
        let selectedUser = UserManager.sharedInstance.userForIndex(indexPath.row)
        var initials: String
        if let firstNameInicial = selectedUser.firstName.characters.first, let lastNameInicial = selectedUser.lastName.characters.first {
            initials = "\(firstNameInicial)\(lastNameInicial)"
        } else {
            initials = ""
        }
        cell.set(with: UserManager.sharedInstance.userForIndex(indexPath.row).userPhotoImage, initials: initials)
        return cell
    }
}
