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
           
                self.performSegueWithIdentifier("HomeDirect", sender: nil)
    
                
            } else {
                
                print("not sign in")
            }
        }
        

        
    }


   
}

