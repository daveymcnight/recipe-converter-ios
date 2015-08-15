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
    
    
    @IBAction func socket(sender: AnyObject) {
        
        

        let socket = SocketIOClient(socketURL: "www.regisscis.net:8080", opts: [
            "reconnects": true, // Default is true
            "reconnectAttempts": 5, // Default is -1 (infinite tries)
            "reconnectWait": 5, // Default is 10
            "nsp": "swift", // connects to the specified namespace. Default is /
            "forcePolling": true, // if true, the socket will only use XHR polling, Default is false (polling/WebSockets)
            ])
        
        socket.onAny {println("got event: \($0.event) with items \($0.items)")}
        
        // Socket Events
        socket.on("connect") {data, ack in
            println("socket connected")
            
            // Sending messages
            socket.emit("")
            println(String(stringInterpolationSegment: data))
        
        }
        
        
       
        // Connecting
        socket.connect()

        
    }
    
    @IBOutlet weak var systemsTableView: UITableView!
    
    @IBOutlet weak var inputSystem: UITextField!
    
    
    @IBAction func addSystem(sender: AnyObject) {
        
        
        var postsEndpoint: String = "http://localhost/post/system";
        var newPost = ["name": inputSystem.text, "body": "I iz fisrt", "userId": 1];
        
        Alamofire.request(.POST, postsEndpoint, parameters: newPost as! [String : AnyObject], encoding: .JSON)
            .responseJSON { (request, response, data, error) in
                if let anError = error
                {
                    // got an error in getting the data, need to handle it
                    println("error calling POST on /posts")
                    println(error)
                }
                else if let data: AnyObject = data
                {
                    // handle the results as JSON, without a bunch of nested if loops
                    let post = JSON(data)
                    // to make sure it posted, print the results
                    println("The post is: " + post.description)
                }
        }
        self.do_table_refresh();
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let url = NSURL(string: "http://localhost/systems")
        
        systemsArray.removeAll(keepCapacity: false)
        
        Alamofire.request(.GET, "http://localhost/systems")
            .responseJSON { (_, _, json, _) in
               let json = JSON(json!)
               //println(json)
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

