//
//  RoundButtons.swift
//  Networking
//
//  Created by Jose Tapizquent on 8/21/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

@IBDesignable
class circleButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
}
