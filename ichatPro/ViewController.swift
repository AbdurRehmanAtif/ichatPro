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
        // Do any additional setup after loading the view, typically from a nib.
        FIRAuth.auth()?.addAuthStateDidChangeListener({ (auth:FIRAuth, user:FIRUser?) in
        
            if let user = user {
                print(user)
                
              self.performSegueWithIdentifier("ab", sender: nil)
              
                
            } else {
                
                print(auth)
                print("Imrunning")
          
            }
        
            
            
       })
        

    }
  
    @IBAction func FacebookButton(sender: AnyObject) {
     
        
    let log = FBSDKLoginManager()
        
        log.logInWithReadPermissions(["email"]) { (result:FBSDKLoginManagerLoginResult!, Error:NSError!) in
            
            if Error != nil {
                
                print(Error)
                print("_______________________________")
                
            
                
            }
            else {
                
           
                
            let c = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                
                
                FIRAuth.auth()?.signInWithCredential(c) { (user, error) in
                    
                    
            
                    
                    if user != nil {
                        
                        print("SucessFull\(user)")
                        
                
                    }
                    
                    else {
                        
                        print("ERRORRRRR")
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                

            
             
            }
            
            
        }
        
     
        
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

