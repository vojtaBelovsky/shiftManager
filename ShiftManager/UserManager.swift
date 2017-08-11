//
//  RegisterManager.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 09.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    
    let defaults = UserDefaults.standard
   
    
    
    func isUserRegistered() -> Bool {
        
        if userIsRegister == true {
        return true
    }
        else{
            return false
        }
    }
}
