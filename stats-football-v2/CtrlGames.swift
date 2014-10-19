//
//  CtrlGames.swift
//  stats-football-v2
//
//  Created by grobinson on 10/16/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit
import CoreData

class CtrlGames: UITableViewController {
    
    
    var games: Array<AnyObject> = []
    var teams: Array<AnyObject> = []
    var teamKey = [String:[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        var freq = NSFetchRequest(entityName: "Games")
        games = contxt.executeFetchRequest(freq, error: nil)!
        JP("GAMES")
        JP(games)
        JP("COUNT")
        JP(games.count)
        
        freq = NSFetchRequest(entityName: "Teams")
        teams = contxt.executeFetchRequest(freq, error: nil)!
        
        var i = 0
        for a in teams {
            
            var data: NSManagedObject = teams[i] as NSManagedObject
            var key: String = data.valueForKeyPath("id") as String
            
            teamKey[key] = [
                "full_name": data.valueForKeyPath("full_name") as String,
                "short_name": data.valueForKeyPath("short_name") as String
            ]
            
            i++
            
        }
        
        tableView.reloadData()
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "game_update" {
            
            var selectedGame: NSManagedObject = games[self.tableView.indexPathForSelectedRow()!.row] as NSManagedObject
            
            let IVC: CtrlGame = segue.destinationViewController as CtrlGame
            
            IVC.id = selectedGame.valueForKey("id") as String
            IVC.away_id = selectedGame.valueForKey("away_id") as String
            IVC.home_id = selectedGame.valueForKey("home_id") as String
            IVC.event_date = selectedGame.valueForKey("event_date") as NSDate
            
            IVC.existingGame = selectedGame
            
        } else {
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return games.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell {
        
        let cellID: String = "games_cell"
        
        var cell: CellGames = tableView.dequeueReusableCellWithIdentifier(cellID) as CellGames
        
        if let ip = indexPath {
            
            JP("CELL CONSTRUCT")
            JP(teamKey)
            
            var data: NSManagedObject = games[ip.row] as NSManagedObject
            
            var home_id: String = data.valueForKeyPath("home_id") as String
            var away_id: String = data.valueForKeyPath("away_id") as String
            JP(home_id)
            var home_team: String = teamKey[home_id]!["full_name"]! as String
            var away_team: String = teamKey[away_id]!["full_name"]! as String
            var event_date: NSDate = data.valueForKeyPath("event_date") as NSDate
            
            cell.topTXT.text = "\(away_team) @ \(home_team)" as String
            
            let dateFormatter:NSDateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MMMM d, YYYY h:mm a"
            
            let dateString:NSString = dateFormatter.stringFromDate(event_date as NSDate)
            
            cell.btmTXT.text = (dateString as String)
            
        }
        
        return cell
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
