//
//  LabelWithButtonView.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 06/09/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class LabelWithButtonView: UIView {
    
    fileprivate let label = UILabel()
    let button = UIButton()
    
    init(with title: String) {
        super.init(frame: .zero)
        setupViewItems()
        addSubviewsForSuperview()
        setupConstraints()
        label.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViewItems() {
        button.setImage(#imageLiteral(resourceName: "trashIcon"), for: .normal)
    }
    
    fileprivate func addSubviewsForSuperview() {
        addSubview(label)
        addSubview(button)
    }
    
    fileprivate func setupConstraints() {
        label.autoPinEdge(toSuperviewEdge: .top)
        label.autoPinEdge(toSuperviewEdge: .leading)
        label.autoPinEdge(toSuperviewEdge: .bottom)
        
        button.autoSetDimensions(to: CGSize(width: 25.0, height: 25.0))
        button.autoPinEdge(toSuperviewEdge: .trailing)
        button.autoAlignAxis(.horizontal, toSameAxisOf: label)
    }
}
