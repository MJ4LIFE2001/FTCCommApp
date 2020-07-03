//
//  SignUpVC.swift
//  FTCCommApp
//
//  Created by Dev Masrani on 7/3/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage
import SwiftKeychainWrapper

class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var userImagePicker: UIImageView!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet wear var signUpBtn: UIButton!
    
    var userUid: String!
    
    var emailField: String!
    
    var passwordField: String!
    
    var imagePicker: UIImagePickerController!
    
    var imageSelected = false
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        imagePicker = UIImagePickerController()
        
        imagePicker.allowsEditing = true
        
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        
        if let _ = KeychainWrapper.standard.string(forKey: "uid") {
            
            performSegue(withIdentifier: "toMessage", sender: nil)
        }
    }
    
    func uploadImg() {
        
        if usernameField.text == nil {
            
            signUpBtn.isEnabled = false
            
        } else {
            username = usernameField.text
            
            signUpBtn.isEnabled = true
        }
        
        guard let imag = userImage.image, imageSelected == true else {
            print("image needs to be selected")
            
            return
        }
        
        if let imgData = UIImageJPEGRepresentation(img, 0.2){
            
            let imgUid = NSUUID().uuidString
            
            let metadata = StorageMetadata
        }
    }
    @IBAction func createAccount (_ sender: AnyObject){
        
        Auth.auth().createUser(withEmail: emailField, password: passwordField,
            completion: { (user, error) in
                                    if error != nil {
                                        
                                        print("Cant create user")
                                    } else {
                                        
                                        if let user = user {
                                            
                                            self.userUid = user.uid
                                        }
                                    }
                
                self.uploadImg()
        }
        )
    }
    
    @IBAction func selectedImgPicker (_ sender: AnyObject){
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cancel (_sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
    }
}
