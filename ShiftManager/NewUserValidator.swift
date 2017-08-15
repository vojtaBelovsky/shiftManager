//
//  RegisterValidate.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 02.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class NewUserValidator: NSObject {
    
    static func validateNewUser(_ name: UserModel) -> NSError? {
        
        var error : NSError? = nil
        
        if name.firstName.isEmpty {
            let userInfo: [AnyHashable : Any] =
                [
                    NSLocalizedDescriptionKey :  NSLocalizedString("RegisterAllert_loc001", comment: "") , 
                    NSLocalizedFailureReasonErrorKey : NSLocalizedString("RegisterAllert_loc002", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: 0, userInfo: userInfo)
            return error
        }
        
        if name.lastName.isEmpty {
            let userInfo: [AnyHashable : Any] =
                [
                    NSLocalizedDescriptionKey :  NSLocalizedString("RegisterAllert_loc001", comment: "") ,
                    NSLocalizedFailureReasonErrorKey : NSLocalizedString("RegisterAllert_loc003", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: 0, userInfo: userInfo)
            return error
        }
        return nil
    }
    
}
