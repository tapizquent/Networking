//
//  ImageExtensions.swift
//  Networking
//
//  Created by Jose Tapizquent on 8/14/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func shake() {
        
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.6
        animation.values = [-10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
    
    
    
}

