//
//  ColorSelectDataSource.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 13.07.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

final class ColorSelectDataSource: NSObject, UICollectionViewDataSource {
    
//    let colors: [UIColor] = [Colors.sandyBrown, Colors.moss, Colors.silver, Colors.maroon, Colors.khaki, Colors.pool, Colors.teal, Colors.night, Colors.lake, Colors.bluebell, Colors.beat, Colors.persimmon, Colors.papaya, Colors.poppy, Colors.blossom, Colors.plun, Colors.strawberry, Colors.fuchsia, Colors.red, Colors.sunshine, Colors.fig, Colors.chocolate, Colors.paperBag, Colors.gravel]
    
    let colors: [UIColor] = [MaterialColors.blueGrey, MaterialColors.indigo, MaterialColors.green, MaterialColors.lightGreen, MaterialColors.pink, MaterialColors.purple, MaterialColors.yellow, MaterialColors.deepOrange, MaterialColors.lightBlue, MaterialColors.lime, MaterialColors.brown, MaterialColors.blue, MaterialColors.cyan, MaterialColors.orange, MaterialColors.grey, MaterialColors.deepPurple, MaterialColors.teal, MaterialColors.amber, MaterialColors.red, MaterialColors.paperBag, MaterialColors.maroon, MaterialColors.sandyBrown, MaterialColors.persimmon, MaterialColors.papaya]
    
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
