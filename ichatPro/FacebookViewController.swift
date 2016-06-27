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
import FirebaseStorage


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
                            
                             NSUserDefaults.standardUserDefaults().setValue(self.UserNmaeInput.text, forKey: "Name")
                            let storyb:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            
                            let Welcome:UIViewController = storyb.instantiateViewControllerWithIdentifier("welcome1")
                            
                            self.presentViewController(Welcome, animated: true, completion: nil)
                                
                           
                            
                        
                            
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
                    
                     NSUserDefaults.standardUserDefaults().setValue(user?.displayName, forKey: "Name")
                        
                        NSUserDefaults.standardUserDefaults().setURL(user?.photoURL, forKey: "pic")
                        
                        
                        
                        let storage = FIRStorage.storage()
                        let storageRef = storage.referenceForURL("gs://finalyearproject-fb77f.appspot.com")
                        
                        
                        let request = FBSDKGraphRequest(graphPath: "me/picture", parameters:["height":300 , "width" :300 ,"redirect":false], HTTPMethod: "GET")
                        request.startWithCompletionHandler({(connection, result, error) -> Void in
                            
                            if error != nil {
                                
                                
                        
                            }
                            
                            else {
                                
                                let temp = result as? JSONDictionary
                                let data = temp!["data"] as? JSONDictionary
                                let picFinalUrl = data!["url"] as? String
                                if let picFormate:NSData = NSData(contentsOfURL: NSURL(string: picFinalUrl!)!)!{
                                    
                                    let storage = storageRef.child("\(user!.uid)/ProfilePic.jpg")
                                    
                                    storage.putData(picFormate,metadata: nil){
                                        
                                        metadata , error in
                                        
                                        if error != nil {
                                            
                                            print("PIC UPLOAD ERROR")
                                        }
                                        else{
                                    
                                            let storage = FIRStorage.storage()
                                            let storageRef = storage.referenceForURL("gs://finalyearproject-fb77f.appspot.com")
                                            let Storage = storageRef.child("\(user!.uid)/ProfilePic.jpg")
                                            
                                            Storage.dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
                                                if (error != nil) {
                                                    // Uh-oh, an error occurred!
                                                } else {
                                                    // Data for "images/island.jpg" is returned
                                               
                                                    
                                                    print("Data after Download")
                                                    
                                                    let url:NSData = data!
                                                    
                                                    print(url)
                                                    let y = url
                                                  
                                                    
                                                    if y == url {
                                                        
                                                        NSUserDefaults.standardUserDefaults().setValue(url, forKey: "wah")
                                                        let storyb:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                                                        
                                                        let Welcome:UIViewController = storyb.instantiateViewControllerWithIdentifier("welcome1")
                                                        
                                                        self.presentViewController(Welcome, animated: true, completion: nil)
                                                    }
                                                    else{
                                                        
                                                        print("Waite ker raha hwn ab")
                                                    }
                                                  
                                                    
                                                }
                                            }
                                            
                                            
                                            
                                        

                                            
                                            
                                        }
                                    }
                                    
                                    
                                    
                                }
                                else{
                                    
                                    // agr na howi upload
                                }
                                
                                
                                
                               
                                
                            }
                            
                            
                            
                            
                        })

                        
                        
                        
            
                        
           
                    }
                        
                    else {
                      
                        print(error)
                        
                    }
                    
                    
                    
                    
                }
                
                
                
            }
            
            
        }
        
        
        
        
    }
        
        
    
        

            
    


}

    
  
    

 
    

