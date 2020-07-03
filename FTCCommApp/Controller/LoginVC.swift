//
//  ViewController.swift
//  FTCCommApp
//
//  Created by Rohit Ravi on 7/2/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class LoginVC: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var  userUid: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignIn( sender: AnyObject){
        if let email = emailField.text, let password = passwordField.text{
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion:
                {(user,error) in
                    if (error == nil){
                        self.userUid = user?.uid
                        KeychainWrapper.standard.setup(self.userUid, forKey: "uid")
                        performSegue(withIdentifier: "toMessages1" , sender: nil )
                    } else {
                         performSegue(withIdentifier: "toSignUp" , sender: nil )
                    }
            })
        }
    }

}

