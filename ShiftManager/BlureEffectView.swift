//
//  BlureEffectView.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 15.09.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class BlureEffectView: UIView {
    
    var visualEffect = UIVisualEffectView()
    init() {
        super.init(frame: .zero)
        initializeViewsAndAddThemAsSubviews()
        //setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeViewsAndAddThemAsSubviews() {
        let blurEffect = UIBlurEffect(style: .light)
        visualEffect = UIVisualEffectView(effect: blurEffect)
        //backgroundColor = .red
    }
    
    //fileprivate func setupConstraints() {
    //    visualEffect.autoPinEdgesToSuperviewEdges()
    //}
}
