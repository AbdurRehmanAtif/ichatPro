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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginButton: FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        self.view!.addSubview(loginButton)

    }
    
   
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

