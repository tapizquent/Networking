//
//  NewAccVC.swift
//  Networking
//
//  Created by Jose Tapizquent on 8/15/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import Firebase

class NewAccVC: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var newPwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Hides keyboard when user taps return or outside textField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        nameTextField.resignFirstResponder()
        newEmailTextField.resignFirstResponder()
        newPwdTextField.resignFirstResponder()
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createAccPressed(_ sender: Any) {
        if newEmailTextField.text?.isEmpty == false && newPwdTextField.text?.isEmpty == false {
            let email = newEmailTextField.text
            let pwd = newPwdTextField.text
            FIRAuth.auth()?.signIn(withEmail: email!, password: pwd!, completion: { (user, error) in
                if error == nil {
                    print("NOTE: USER ALREADY EXISTS WITH EMAIL: \(String(describing: email))")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email!, password: pwd!, completion: { (user, error) in
                        if error != nil {
                            print("NOTE(ERROR): Sorry account could not be created. Something went wrong")
                        } else {
                            print("NOTE: User created successfully with email")
                            self.dismiss(animated: true)
                        }
                    })
                }
            })
        } else {
            print("NOTE(ERROR): Text fields can't be empty when creating user")
        }
    }

    @IBAction func newAccCancelled(_ sender: Any) {
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
