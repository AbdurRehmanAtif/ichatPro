//
//  wELCOMEsCREENsecond.swift
//  ichatPro
//
//  Created by Abd-ur-rehman Atif on 26/06/2016.
//  Copyright © 2016 Abd-ur-rehman Atif. All rights reserved.
//

import UIKit
import FirebaseStorage
import Firebase
import FirebaseAuth

class wELCOMEsCREENsecond: UIViewController {

    @IBOutlet var Picture: UIImageView!
    @IBOutlet var NameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Picture.layer.cornerRadius = Picture.frame.size.width/2
        Picture.clipsToBounds = true
        
        var temp = NSUserDefaults.standardUserDefaults().valueForKey("Name")
        
        if temp != nil {
        NameLabel.text = temp! as? String
         
        }
        else{
            
            temp = "Please Enter Name"
              NameLabel.text = temp! as? String
        }
        
        
     let temp2 = NSUserDefaults.standardUserDefaults().valueForKey("wah")
        
        print("Next class Running")
        
        if let g = temp2 as? NSData {
            
            Picture.image = UIImage(data: g)
        }
        else {
            print("nahi yarr kkutch or")
        }
        
                
    }
        
        
        
}
