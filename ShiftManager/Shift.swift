//
//  Shift.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 19.07.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import Foundation
import UIKit

class Shift: NSObject, NSCoding {
    
    var shifID : Int = 0
    var name : String?
    var interval : Int = 0
    var date : Date?
    var color : UIColor?
    
    fileprivate let namePropertyKey = "namePropertyKey"
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let name = aDecoder.decodeObject(forKey: namePropertyKey) as? String {
            self.name = name
        }
    }
    
    func encode(with aCoder: NSCoder) {
        if let name = self.name {
            aCoder.encode(name, forKey: namePropertyKey)
        }
    }
    
}
