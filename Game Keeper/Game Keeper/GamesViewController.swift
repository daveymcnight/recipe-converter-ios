//
//  GamesViewController.swift
//  Game Keeper
//
//  Created by Davey McNight on 7/22/15.
//  Copyright (c) 2015 msse652. All rights reserved.
//

import UIKit
import Alamofire


class GamesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var tableView: UITableView!
    
    var gamesArray: [String] = []
    var parentSystem: System!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (parentSystem != nil){
            println(parentSystem.name)
        }
        
        Alamofire.request(.GET, "http://localhost/game/\(parentSystem.id)")
            .responseJSON { (_, _, json, _) in
                let json = JSON(json!)
                println(json)
                for (index, object) in json {
                    let name = object["name"].stringValue
                    self.gamesArray.append(name);
                }
                self.do_table_refresh()
        }
        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesArray.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("gameCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = gamesArray[indexPath.row];
        return cell;
    }
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
