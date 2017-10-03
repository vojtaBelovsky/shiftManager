//
//  AdBannerViewController.swift
//  ShiftManager
//
//  Created by Jiří Tomis on 02.10.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import GoogleMobileAds

class AdBannerViewController: UIViewController, GADBannerViewDelegate {
    
    var adBannerView = AdBannerView()
    
    override func loadView() {
        self.view = adBannerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    fileprivate func setup() {
        adBannerView.bannerView.delegate = self
        adBannerView.bannerView.rootViewController = self
        adBannerView.bannerView.load(GADRequest())
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        bannerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            bannerView.alpha = 1
        })
    }
}
