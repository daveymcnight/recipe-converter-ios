//
//  ViewController.swift
//  Game Keeper
//
//  Created by Davey McNight on 7/8/15.
//  Copyright (c) 2015 msse652. All rights reserved.
//

import UIKit


var systemsArray: [String] = []

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var systemsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "http://localhost/systems")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
            let json = JSON(data:data)
            
            for (index, object) in json {
                let name = object["name"].stringValue
                systemsArray.append(name);
                
            }
             self.do_table_refresh()
           
        }
        
        task.resume()
       
        
    }
    
   func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return systemsArray.count;
    }
   
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("systemCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = systemsArray[indexPath.row];
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

