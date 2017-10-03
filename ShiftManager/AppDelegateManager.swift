//
//  AppDelegateManager.swift
//  ShiftManager
//
//  Created by Jiří Tomis on 03.10.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit
import GoogleMobileAds

final class AppDelegateManager: NSObject {
    
    var window: UIWindow?
    var bannerWindow: UIWindow?
    let bannerHeight: CGFloat = 50
    let screenBounds = UIScreen.main.bounds
    
    override init() {
        super.init()
        
    }
    
    func launchingApplication() {
        
        window = UIWindow(frame: CGRect(x: 0, y: 0, width: screenBounds.width, height: screenBounds.height-bannerHeight))
        window?.backgroundColor = UIColor.white
        window?.rootViewController = UINavigationController(rootViewController: CalendarViewController())
        window?.makeKeyAndVisible()
        
        bannerWindow = UIWindow(frame: CGRect(x: 0, y: screenBounds.height-bannerHeight, width: screenBounds.width, height: bannerHeight))
        bannerWindow?.rootViewController = AdBannerViewController()
        bannerWindow?.isHidden = false
        
        GADMobileAds.configure(withApplicationID: "ca-app-pub-3940256099942544~1458002511")
    }
    
}
