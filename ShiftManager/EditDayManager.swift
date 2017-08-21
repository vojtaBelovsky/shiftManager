//
//  EditDayManager.swift
//  ShiftManager
//
//  Created by Daniel Krezelok on 21/08/2017.
//  Copyright © 2017 Tadeusz Raszka. All rights reserved.
//

import UIKit

class EditDayManager: NSObject {
    
    fileprivate let defaults = UserDefaults.standard
    fileprivate var editDays: [EditCalendarDayModel] = []
    fileprivate let editingDayKey = "editingDayKey"
    
    static let sharedInstance = EditDayManager()
    
    private override init() {
        super.init()
            saveEditingDayToPersistentStorage()
            loadEditingDayFromUserDefaults()
        }
    
    fileprivate func saveEditingDayToPersistentStorage() {
        let editAsData = editDays.map { (edit) -> Data in
            NSKeyedArchiver.archivedData(withRootObject: edit)
        }
        defaults.set(editAsData, forKey: editingDayKey)
        defaults.synchronize()
    }
    
    fileprivate func loadEditingDayFromUserDefaults() {
        var editDayArray: [EditCalendarDayModel] = []
        if let EditCalendarDayModelsAsData = defaults.object(forKey: editingDayKey) as? [Data] {
            EditCalendarDayModelsAsData.forEach({ editModelData in
                editDayArray.append(NSKeyedUnarchiver.unarchiveObject(with:editModelData) as! EditCalendarDayModel)
            })
        }
        editDays = editDayArray
    }
}
