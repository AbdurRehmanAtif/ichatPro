//
//  ViewController.swift
//  ichatPro
//
//  Created by Abd-ur-rehman Atif on 24/06/2016.
//  Copyright © 2016 Abd-ur-rehman Atif. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if user != nil {
                
                print("wapis yay chalta ha")
                 self.currentUser()
    
                
            } else {
                
                print("not sign in")
            }
        }
        

        
    }


    func currentUser(){
        
        if let user = FIRAuth.auth()?.currentUser {
            
            let name:String! = user.displayName
            
            let email = user.email
            let photoUrl = user.photoURL
           
            
            // The user's ID, unique to the Firebase project.
           // let data =  NSData(contentsOfURL: user.photoURL!)
           // self.PicToWelcome.image = UIImage(data: data!)
         
           print("____________")
            print(name)
            print("phr yay be")
            print(email)
            print(photoUrl)
            print("____________")
            self.performSegueWithIdentifier("HomeDirect", sender: nil)
            
        } else {
            
            // No user is signed in.
        }
        
    }
    


}

