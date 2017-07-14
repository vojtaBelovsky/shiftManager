//
//  ColorSelectDataSource.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 13.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class ColorSelectDataSource: NSObject, UICollectionViewDataSource {
    
    let color: [UIColor] = [.red, .green, .blue, .red, .green, .blue, .red, .green, .blue, .red, .green, .blue]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: colorSelectCollectionViewCellReuseIdentifier, for: indexPath)
            as? ColorSelectCollectionViewCell
            else {
                assertionFailure("Non existing cell")
                return UICollectionViewCell()
        }
        cell.backgroundColor = color[indexPath.row]
        return cell
    }

}
