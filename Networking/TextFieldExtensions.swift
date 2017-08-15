//
//  TextFieldExtensions.swift
//  Networking
//
//  Created by Jose Tapizquent on 8/14/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit


extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
}
