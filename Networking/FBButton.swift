//
//  FBButton.swift
//  Networking
//
//  Created by Jose Tapizquent on 8/14/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class FBButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.9).cgColor
        //layer.shadowOpacity = 0.9
        //layer.shadowRadius = 2.0
        //layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }

}
