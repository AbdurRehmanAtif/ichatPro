//
//  LogOfViewController.swift
//  ichatPro
//
//  Created by Abd-ur-rehman Atif on 26/06/2016.
//  Copyright © 2016 Abd-ur-rehman Atif. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class LogOfViewController: UIViewController {
    
    
    
    
    
    @IBAction func LogOf(sender: AnyObject) {
        
        try! FIRAuth.auth()!.signOut()
     FBSDKAccessToken.setCurrentAccessToken(nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

 

}
