//
//  ViewController.swift
//  Networking
//
//  Created by Jose Tapizquent on 8/12/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import GoogleSignIn
import SwiftKeychainWrapper

class SignInVC: UIViewController, UITextFieldDelegate, GIDSignInUIDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var GsignInButton: GIDSignInButton!

    @IBOutlet weak var emailIcon: UIImageView!
    @IBOutlet weak var passwordIcon: UIImageView!
    @IBOutlet weak var errorMsgLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailTextField.delegate = self
        self.passTextField.delegate = self
        
        GIDSignIn.sharedInstance().uiDelegate = self
        //GIDSignIn.sharedInstance().signIn()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Makes animation when email or pass is tapped
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if emailTextField.isFirstResponder == true {
            emailIcon.shake()
        } else if passTextField.isFirstResponder == true {
            passwordIcon.shake()
        }
        
        self.errorMsgLbl.isHidden = true
        
    }
    
    // Hides keyboard when user taps return or outside textField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
        checkFieldEmpty()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        emailTextField.resignFirstResponder()
        passTextField.resignFirstResponder()
        
        checkFieldEmpty()
        
        return true
    }
    
    @IBAction func fbLogginPressed(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("NOTE(ERROR): Unable to authenticate with facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("NOTE(ERROR): User cancelled FaceBook log in - \(String(describing: error))")
            } else {
                print("NOTE: Successfully Authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: {(user, error) in
            if error != nil {
                print("NOTE(ERROR): Unable to authenticate with Firebase- \(String(describing: error))")
            } else {
                print("NOTE: Successfully Authenticated with Firebase")
                if let user = user {
                    KeychainWrapper.standard.set(user.uid, forKey: KEY_UID)
                }
            }
        })
    }
    
    @IBAction func signInPressed(_ sender: Any) {
        if emailTextField.text?.isEmpty == false && passTextField.text?.isEmpty == false {
            let email = emailTextField.text
            let pwd = passTextField.text
            FIRAuth.auth()?.signIn(withEmail: email!, password: pwd!, completion: { (user, error) in
                if error == nil {
                    print("NOTE: Account exists, user successfully authenticated w/ firebase EMAIL")
                } else {
                    print("NOTE(ERROR): User does not exists")
                    self.errorMsgLbl.isHidden = false
                }
            })
        } else {
            checkFieldEmpty()
        }
    }
    
    func checkFieldEmpty(){
        if emailTextField.text?.isEmpty == true {
            emailTextField.placeholder = "Email can't be empty"
        } else if passTextField.text?.isEmpty == true {
            passTextField.placeholder = "Password can't be empty"
        }
    }
}



