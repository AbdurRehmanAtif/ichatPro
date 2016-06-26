//
//  FacebookViewController.swift
//  ichatPro
//
//  Created by Abd-ur-rehman Atif on 25/06/2016.
//  Copyright © 2016 Abd-ur-rehman Atif. All rights reserved.
//


import FBSDKLoginKit
import Firebase
import UIKit


class FacebookViewController: UIViewController {

    @IBOutlet var UserNmaeInput: UITextField!
    
    @IBOutlet var EmailFromUser: UITextField!
    
    @IBOutlet var PasswordFromUser: UITextField!
    
    
    
    
    @IBAction func CreatUserbutton(sender: AnyObject) {
        
        
        if let Email = EmailFromUser.text where Email != "" ,let pwd = PasswordFromUser.text where pwd != "" {
            
            
            FIRAuth.auth()?.createUserWithEmail(Email, password: pwd) { (user, error) in
                
                if error != nil {
                    
                    
                }
                else {
                    
                  
                    FIRAuth.auth()?.signInWithEmail(Email, password: pwd) { (user, error) in
                        
                        
                        if error != nil
                        {
                            print("SignIn pROBLUM AFTER GETTING REGISTER")
                            
                        }
                        else {
                            
                            
                        self.performSegueWithIdentifier("Cheal", sender: nil)
                                
                           
                            
                        
                            
                        }
                        
                    }
                    
                }
                
                
                
            }
            
            
            
        }
        
        
        
        
        
        
        
        
        
    }
    
    
    

    // Fcaebook button Press
    @IBAction func FacebookButtonUser(sender: AnyObject) {
        
        
        let log = FBSDKLoginManager()
        
        log.logInWithReadPermissions(["email"]) { (result:FBSDKLoginManagerLoginResult!, error:NSError!) in
            
            if error != nil {
                
                print(error)
                
            }
            else {
                
                
                
                let c = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
                
                
                FIRAuth.auth()?.signInWithCredential(c) { (user, error) in
                    
                    
                    if user != nil {
                        
                   
                    
                       
                    self.performSegueWithIdentifier("Cheal", sender: nil)
                    
                    }
                        
                    else {
                      
                        print(error)
                        
                    }
                    
                    
                    
                    
                }
                
                
                
            }
            
            
        }
        
        
        
        
    }
        
        
    
        

            
    


}

    
  
    

 
    

