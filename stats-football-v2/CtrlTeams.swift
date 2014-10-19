//
//  CtrlTeams.swift
//  stats-football-v2
//
//  Created by grobinson on 10/16/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit
import CoreData

class CtrlTeams: UITableViewController {
    
    var teams: Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.separatorColor = UIColor.clearColor()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        let freq = NSFetchRequest(entityName: "Teams")
        
        var error: NSError?
        
        teams = contxt.executeFetchRequest(freq, error: nil)!
        
        tableView.reloadData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "team_update" {
            
            var selectedTeam: NSManagedObject = teams[self.tableView.indexPathForSelectedRow()!.row] as NSManagedObject
            
            let IVC: CtrlTeam = segue.destinationViewController as CtrlTeam
            
            IVC.id = selectedTeam.valueForKey("id") as String
            IVC.full_name = selectedTeam.valueForKey("full_name") as String
            IVC.short_name = selectedTeam.valueForKey("short_name") as String
            
            IVC.existingTeam = selectedTeam
            
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
        return teams.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell {
        
        JP("SECTION: \(indexPath?.section) --- ROW: \(indexPath?.row)")
        
        let cellID: String = "teams_cell"
        
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellID) as UITableViewCell
        
        if let ip = indexPath {
            
            var data: NSManagedObject = teams[ip.row] as NSManagedObject
            cell.textLabel?.text = (data.valueForKeyPath("full_name") as String)
            
            var tid: String = data.valueForKeyPath("short_name") as String
            
            cell.detailTextLabel?.text = tid
            
        }
//        cell.backgroundColor = UIColor.clearColor()
        
//        cell.backgroundColor = UIColor.clearColor()
        
        return cell
        
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        
        switch editingStyle {
        case .Delete:
            
            if let tv = tableView {
                
                contxt.deleteObject(teams[indexPath!.row] as NSManagedObject)
                teams.removeAtIndex(indexPath!.row)
                tv.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                
            }
            
            var error: NSError? = nil
            if !contxt.save(&error) {
                abort()
            }
            
        default:
            return
        }
        
    }

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
