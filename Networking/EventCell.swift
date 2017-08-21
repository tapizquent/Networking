//
//  EventCell.swift
//  Networking
//
//  Created by Jose Tapizquent on 8/21/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    @IBOutlet weak var eventImg: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventLocation: UILabel!
    @IBAction func likeEventBtn(_ sender: Any) {
        print("Event liked")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        eventImg.tintColor = UIColor.orange
        // Initialization code
        
    }

}
