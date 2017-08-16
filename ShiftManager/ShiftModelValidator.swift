//
//  ShiftValidate.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 02.08.17.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

final class ShiftModelValidator: NSObject {
    
    static func validateShift(_ shift: ShiftModel) -> NSError? {
        
        var error : NSError? = nil
        
        if shift.name.isEmpty {
            let userInfo: [AnyHashable : Any] = [
                NSLocalizedDescriptionKey :  NSLocalizedString("NewShiftAllert_loc001", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("NewShiftAllert_loc002", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: 0, userInfo: userInfo)
            return error
        }
        
        if shift.shortcut.characters.count > 2 || shift.shortcut.isEmpty {
            let userInfo: [AnyHashable : Any] = [
                NSLocalizedDescriptionKey :  NSLocalizedString("NewShiftAllert_loc001", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("NewShiftAllert_loc006", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: 0, userInfo: userInfo)
            return error
        }
        
        if shift.interval <= 1 {
            let userInfo: [AnyHashable : Any] = [
                NSLocalizedDescriptionKey :  NSLocalizedString("NewShiftAllert_loc001", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("NewShiftAllert_loc003", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: 0, userInfo: userInfo)
            return error
        }
        
        if shift.date == nil {
            let userInfo: [AnyHashable : Any] = [
                NSLocalizedDescriptionKey :  NSLocalizedString("NewShiftAllert_loc001", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("NewShiftAllert_loc006", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: 0, userInfo: userInfo)
            return error
        }
        
        if shift.color == UIColor.white || shift.color == nil {
            let userInfo: [AnyHashable : Any] = [
                NSLocalizedDescriptionKey :  NSLocalizedString("NewShiftAllert_loc001", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("NewShiftAllert_loc005", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: 0, userInfo: userInfo)
            return error
        }
        
        return nil
    }
}
