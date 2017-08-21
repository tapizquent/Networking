//
//  ShadowsView.swift
//  Networking
//
//  Created by Jose Tapizquent on 8/21/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class ShadowsView: UIView {
    
    override func awakeFromNib() {
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
