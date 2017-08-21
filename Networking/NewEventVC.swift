//
//  NewEventVC.swift
//  Networking
//
//  Created by Jose Tapizquent on 8/21/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import GooglePlaces


class NewEventVC: UIViewController {
    
    @IBOutlet weak var locationTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func canceledPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
