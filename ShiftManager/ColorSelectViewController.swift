//
//  ColorSelectViewController.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 13.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
protocol ColorSelectViewDelegate {
    func colorDidSet(color: UIColor)
}

class ColorSelectViewController: UIViewController, UICollectionViewDelegate{
    
    let colorSelectView: ColorSelectView = ColorSelectView()
    let dataSource = ColorSelectDataSource()
    var delegate: ColorSelectViewDelegate?
    
    override func loadView() {
        self.view = colorSelectView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge.bottom
        
        colorSelectView.collectionView.register(ColorSelectCollectionViewCell.self, forCellWithReuseIdentifier: colorSelectCollectionViewCellReuseIdentifier)
        colorSelectView.collectionView.dataSource = dataSource
        colorSelectView.collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color: UIColor = dataSource.colors[indexPath.row]
        delegate?.colorDidSet(color: color)
        UserDefaults.standard.set(color, forKey: "color")
        UserDefaults.standard.synchronize()
        dismiss(animated: true, completion: nil)
    }
}
