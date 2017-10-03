//
//  AdBannerView.swift
//  ShiftManager
//
//  Created by Jiří Tomis on 02.10.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import PureLayout
import GoogleMobileAds

class AdBannerView: UIView {
    
    var bannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        addSubview(bannerView)
        
        bannerView.autoPinEdgesToSuperviewEdges()
    }
}
