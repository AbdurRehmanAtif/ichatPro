//
//  HomeViewController.swift
//  ichatPro
//
//  Created by Abd-ur-rehman Atif on 25/06/2016.
//  Copyright © 2016 Abd-ur-rehman Atif. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func Logout(sender: AnyObject) {
        
 try! FIRAuth.auth()!.signOut()

        FBSDKAccessToken.setCurrentAccessToken(nil)
        
        performSegueWithIdentifier("abc", sender: nil)
        
    }
    

  

 

}
