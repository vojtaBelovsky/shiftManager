//
//  ExtraShiftViewController.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 15/08/2017.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit
import GoogleMobileAds

protocol ExtraShiftViewControllerDelegate: class {
    func setExtraShifts(extraShifts: [ShiftModel])
}

final class ExtraShiftViewController: UIViewController, GADBannerViewDelegate {
    
    fileprivate let extraShiftView = ExtraShiftView()
    fileprivate let dataSource: ExtraShiftDataSource
    public weak var delegate: ExtraShiftViewControllerDelegate?
    
    init(editCalendarDayModel: EditCalendarDayModel) {
        dataSource = ExtraShiftDataSource(editCalendarDayModel: editCalendarDayModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bcg")
        self.view.insertSubview(backgroundImage, at: 0)
        
        edgesForExtendedLayout = UIRectEdge.bottom
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        extraShiftView.navigationBar.setActionButton(self, action: #selector(doneButtonDidPress))
        extraShiftView.navigationBar.setBackButton(self, action: #selector(backButton))
        extraShiftView.tableView.dataSource = dataSource
        
        extraShiftView.bannerView.delegate = self
        extraShiftView.bannerView.rootViewController = self
        extraShiftView.bannerView.load(GADRequest())
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        bannerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            bannerView.alpha = 1
        })
    }
    
    override func loadView() {
        view = extraShiftView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for indexPath in dataSource.preselectedIndexPaths {
            extraShiftView.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
    }
    
    @objc func backButton(){
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonDidPress(){
        let extraShifts = extraShiftView.tableView.indexPathsForSelectedRows?.flatMap {
            UserManager.sharedInstance.shiftForIndex($0.row)
        }
        
        delegate?.setExtraShifts(extraShifts: extraShifts ?? [])
        navigationController?.isNavigationBarHidden = true
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
