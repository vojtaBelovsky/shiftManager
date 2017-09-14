//
//  ShiftValidate.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 02.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

public enum shiftErrorType: Int {
    case shiftErrorTypeShiftName = 0, shiftErrorTypeShiftShortcut = 1, shiftErrorTypeShiftInterval = 2, shiftErrorTypeShiftPicker = 3, shiftErrorTypeShiftColor = 4
}

final class ShiftModelValidator: NSObject {
    
    static func validateShift(_ shift: ShiftModel) -> NSError? {
        
        var error : NSError? = nil
        
        if shift.name.isEmpty {
            let userInfo: [AnyHashable : Any] = [
                NSLocalizedDescriptionKey :  NSLocalizedString("NewShiftAllert_loc001", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("NewShiftAllert_loc002", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: shiftErrorType.shiftErrorTypeShiftName.rawValue, userInfo: userInfo)
            return error
        }
        
        if shift.shortcut.characters.count > 2 || shift.shortcut.isEmpty {
            let userInfo: [AnyHashable : Any] = [
                NSLocalizedDescriptionKey :  NSLocalizedString("NewShiftAllert_loc001", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("NewShiftAllert_loc006", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: shiftErrorType.shiftErrorTypeShiftShortcut.rawValue, userInfo: userInfo)
            return error
        }
        
        if shift.interval <= 1 {
            let userInfo: [AnyHashable : Any] = [
                NSLocalizedDescriptionKey :  NSLocalizedString("NewShiftAllert_loc001", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("NewShiftAllert_loc003", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: shiftErrorType.shiftErrorTypeShiftInterval.rawValue, userInfo: userInfo)
            return error
        }
        
        var isFirstDateOfShiftUnique = true
        UserManager.sharedInstance.selectedUser?.shifts.forEach({ shiftModel in
            if shiftModel.firstDateOfShift?.normalizedDate().compare((shift.firstDateOfShift?.normalizedDate())!) == .orderedSame {
                isFirstDateOfShiftUnique = false
            }
        })
        if !isFirstDateOfShiftUnique {
            let userInfo: [AnyHashable : Any] = [
                NSLocalizedDescriptionKey :  NSLocalizedString("NewShiftAllert_loc001", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("NewShiftAllert_loc007", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: shiftErrorType.shiftErrorTypeShiftPicker.rawValue, userInfo: userInfo)
            return error
        }
        
        if shift.color == UIColor.white || shift.color == nil || shift.color == textFields.textFieldColorWithAlpha {
            let userInfo: [AnyHashable : Any] = [
                NSLocalizedDescriptionKey :  NSLocalizedString("NewShiftAllert_loc001", comment: "") ,
                NSLocalizedFailureReasonErrorKey : NSLocalizedString("NewShiftAllert_loc005", comment: "")
            ]
            error = NSError.init(domain: "ShiftModelDomain", code: shiftErrorType.shiftErrorTypeShiftColor.rawValue, userInfo: userInfo)
            return error
        }
        
        return nil
    }
}
