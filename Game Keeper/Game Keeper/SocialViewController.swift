//
//  SocialViewController.swift
//  Game Keeper
//
//  Created by Davey McNight on 7/24/15.
//  Copyright (c) 2015 msse652. All rights reserved.
//

import UIKit
import Social

class SocialViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postOnFB(sender: AnyObject) {
        
        var shareFb : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        self.presentViewController(shareFb, animated: true, completion: nil)
        
    }
    
    @IBAction func postOnTwitter(sender: AnyObject) {
        var shareTwitter : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        self.presentViewController(shareTwitter, animated: true, completion: nil)    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
