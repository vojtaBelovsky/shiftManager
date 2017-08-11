//
//  CalendarDataSource.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 29.06.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class FriendsDataSource: NSObject {
    
    fileprivate let friends: [UserModel]
    
    init(friends: [UserModel]) {
        self.friends = friends

        super.init()
    }
}

extension FriendsDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FriendCollectionCell.self), for: indexPath)
            as? FriendCollectionCell
        else {
            assertionFailure("Non existing cell")
            return UICollectionViewCell()
        }
        
        //TODO: Set photo of User
        return cell
    }
}
