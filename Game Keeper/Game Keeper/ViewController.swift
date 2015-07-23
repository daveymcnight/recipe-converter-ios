//
//  ViewController.swift
//  Game Keeper
//
//  Created by Davey McNight on 7/8/15.
//  Copyright (c) 2015 msse652. All rights reserved.
//

import UIKit
import Alamofire

var systemsArray: [System] = []

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var systemsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let url = NSURL(string: "http://localhost/systems")
        
        systemsArray.removeAll(keepCapacity: false)
        
        Alamofire.request(.GET, "http://localhost/systems")
            .responseJSON { (_, _, json, _) in
               let json = JSON(json!)
               println(json)
                for (index, object) in json {
                    var system = System(id: object["id"].intValue,
                        name: object["name"].stringValue)
                    systemsArray.append(system);
                }
            self.do_table_refresh()
        }
    }
    @IBAction func goToGamesView(sender: AnyObject) {
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var gameVC = self.storyboard?.instantiateViewControllerWithIdentifier("gamesvc") as! GamesViewController
        let tempSystem = systemsArray[indexPath.row] as System
        gameVC.parentSystem = tempSystem
        self.navigationController?.setViewControllers([gameVC], animated: false)
        self.presentViewController(gameVC, animated: true, completion: nil)
        
    }

    
    
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return systemsArray.count;
    }
   
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("systemCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = systemsArray[indexPath.row].name;
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.systemsTableView.reloadData()
            return
        })
    }




}

