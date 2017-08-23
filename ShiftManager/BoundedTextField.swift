//
//  BoundedTextField.swift
//  ShiftManager
//
//  Created by Jiří Tomis on 21.08.17.
//  Copyright © 2017 iDevBand. All rights reserved.
//

import UIKit

class BoundedTextField: UITextField, UITextFieldDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
}
