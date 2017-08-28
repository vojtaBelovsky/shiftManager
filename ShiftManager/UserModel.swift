//
//  UserModel.swift
//  ShiftManager
//
//  Created by Tadeusz Raszka on 09.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import Foundation
import UIKit
    
final class UserModel: NSObject, NSCoding {
    
    var shifts: [ShiftModel] = []
    var editCalendarDays: [Date: EditCalendarDayModel] = [:]
    var shiftForDateDictionary: [Date: ShiftModel] = [:]
    var uniqueID: String = ""
    var userPhotoImage: UIImage?
    var firstName: String = ""
    var lastName: String = ""
    
    fileprivate let userPhotoImagePropertyKey = "userPhotoImagePropertyKey"
    fileprivate let firstNamePropertyKey = "firstNamePropertyKey"
    fileprivate let lastNamePropertyKey = "lastNamePropertyKey"
    fileprivate let userIDKey = "userIDKey"
    fileprivate let shitsPropertyKey = "shitsPropertyKey"
    fileprivate let editCalendarDaysPropertyKey = "editCalendarDaysPropertyKey"
    fileprivate let shiftForDateDictionaryPropertyKey = "shiftForDateDictionaryPropertyKey"

    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        if let userPhotoImage = aDecoder.decodeObject(forKey: userPhotoImagePropertyKey) as? UIImage {
            self.userPhotoImage = userPhotoImage
        }
        
        if let firstName = aDecoder.decodeObject(forKey: firstNamePropertyKey) as? String {
            self.firstName = firstName
        }
        
        if let lastName = aDecoder.decodeObject(forKey: lastNamePropertyKey) as? String {
            self.lastName = lastName
        }
        
        if let userID = aDecoder.decodeObject(forKey: userIDKey) as? String {
            self.uniqueID = userID
        }
        
        if let shifts = aDecoder.decodeObject(forKey: shitsPropertyKey) as? [ShiftModel] {
            self.shifts = shifts
        }
        
        if let editCalendarDays = aDecoder.decodeObject(forKey: editCalendarDaysPropertyKey) as? [Date: EditCalendarDayModel] {
            self.editCalendarDays = editCalendarDays
        }
        
        if let shiftForDateDictionary = aDecoder.decodeObject(forKey: shiftForDateDictionaryPropertyKey) as? [Date: ShiftModel] {
            self .shiftForDateDictionary = shiftForDateDictionary
        }
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(userPhotoImage, forKey: userPhotoImagePropertyKey)
        aCoder.encode(firstName, forKey: firstNamePropertyKey)
        aCoder.encode(lastName, forKey: lastNamePropertyKey)
        aCoder.encode(uniqueID, forKey: userIDKey)
        aCoder.encode(shifts, forKey: shitsPropertyKey)
        aCoder.encode(editCalendarDays, forKey: editCalendarDaysPropertyKey)
        aCoder.encode(shiftForDateDictionary, forKey: shiftForDateDictionaryPropertyKey)
    }
}
