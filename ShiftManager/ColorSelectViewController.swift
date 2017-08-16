//
//  ColorSelectViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 13.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

protocol ColorSelectViewControllerDelegate {
    func colorSelectViewController(_ controller: ColorSelectViewController, didSelectColor: UIColor)
}

class ColorSelectViewController: UIViewController {
    
    let colorSelectView: ColorSelectView = ColorSelectView()
    let dataSource = ColorSelectDataSource()
    var delegate: ColorSelectViewControllerDelegate?
    
    override func loadView() {
        self.view = colorSelectView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge.bottom
        
        colorSelectView.collectionView.register(ColorSelectCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ColorSelectCollectionViewCell.self))
        colorSelectView.collectionView.dataSource = dataSource
        colorSelectView.collectionView.delegate = self
    }
}

extension ColorSelectViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return colorSelectView.getCellSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color: UIColor = dataSource.colors[indexPath.row]
        delegate?.colorSelectViewController(self, didSelectColor: color)
    }
}
