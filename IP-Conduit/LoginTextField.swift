//
//  LoginTextField.swift
//  IP-Conduit
//
//  Created by Nicolas Schmidt on 10/1/17.
//  Copyright © 2017 408 Industries. All rights reserved.
//

import UIKit

@IBDesignable
class LoginTextField: UITextField {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.borderColor = UIColor(white: 231 / 255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 12)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds:bounds)
    }
    
}
