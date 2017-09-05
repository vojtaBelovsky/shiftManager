//
//  ColorSelectDataSource.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 13.07.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

final class ColorSelectDataSource: NSObject, UICollectionViewDataSource {
    
    let colors: [UIColor] = [.black, .darkGray, .red, .green, .blue, .cyan, .lightGray, .yellow, .magenta, .orange, .purple, .brown, Colors.darkGreenClr, Colors.softPurpleClr, Colors.midBlueClr, Colors.darkRedClr, Colors.softBrownClr, Colors.softRedClr, Colors.midGrayClr, Colors.darkOrangeClr, Colors.midYellowClr, Colors.midGreenClr, Colors.midPurpleClr, Colors.darkYellowClr]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: String(describing: ColorSelectCollectionViewCell.self), for: indexPath)
        as? ColorSelectCollectionViewCell else {
            assertionFailure("Non existing cell")
            return UICollectionViewCell()
        }

        cell.backgroundColor = colors[indexPath.row]
        return cell
    }

}
