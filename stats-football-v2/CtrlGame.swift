//
//  CtrlGame.swift
//  stats-football-v2
//
//  Created by grobinson on 10/16/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit
import CoreData

class CtrlGame: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var teamSelected = [0,0]
    
    var teamKey = [String:[String:String]]()
    
    var id: String = ""
    var away_id: String = ""
    var home_id: String = ""
    var event_date: NSDate = NSDate()
    
    var existingGame: NSManagedObject!
    
    @IBOutlet weak var pickerONE: UIPickerView!
    @IBOutlet weak var datePK: UIDatePicker!
    
    @IBAction func dateCHNG(sender: UIDatePicker) {
        
        event_date = sender.date
        
    }
    @IBAction func cancelBTN(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    @IBAction func saveBTN(sender: UIBarButtonItem) {
        
        JP("SAVE GAME")
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        let en = NSEntityDescription.entityForName("Games", inManagedObjectContext: contxt)
        
        var n_away_team: NSManagedObject = teams[teamSelected[0]] as NSManagedObject
        var n_away_id: String = n_away_team.valueForKeyPath("id") as String
        var n_home_team: NSManagedObject = teams[teamSelected[1]] as NSManagedObject
        var n_home_id: String = n_home_team.valueForKeyPath("id") as String
        
        if existingGame == nil {
            
            JP("SAVE NEW")
            var newGame = GamesModel(entity: en!, insertIntoManagedObjectContext: contxt)
            
            var a = Int64(NSDate().timeIntervalSince1970*100000)
            var id_string: String = "\(a)"
            
            newGame.id = id_string
            newGame.event_date = event_date
            
            newGame.away_id = n_away_id
            newGame.home_id = n_home_id
            
        } else {
            
            JP("SAVE EXISTING")
            JP(n_away_team)
            JP(n_home_team)
            existingGame.setValue(id as String, forKey: "id")
            existingGame.setValue(n_away_id as String, forKey: "away_id")
            existingGame.setValue(n_home_id as String, forKey: "home_id")
            existingGame.setValue(event_date as NSDate, forKey: "event_date")
            
        }
        
        contxt.save(nil)
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    var teams: Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePK.minuteInterval = 15
        datePK.setDate(event_date, animated: true)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        let freq = NSFetchRequest(entityName: "Teams")
        
        var error: NSError?
        
        teams = contxt.executeFetchRequest(freq, error: nil)!
        
        pickerONE.reloadAllComponents()
        
        var i = 0
        for a in teams {
            
            var data: NSManagedObject = teams[i] as NSManagedObject
            
            if data.valueForKeyPath("id") as String == away_id as String {
                
                teamSelected[0] = i
                pickerONE.selectRow(i, inComponent: 0, animated: true)
                
            }
            if data.valueForKeyPath("id") as String == home_id as String {
                
                teamSelected[1] = i
                pickerONE.selectRow(i, inComponent: 1, animated: true)
                
            }
            
            i++
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teams.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        var data: NSManagedObject = teams[row] as NSManagedObject
        var str: String = data.valueForKeyPath("full_name") as String
        return str
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        teamSelected[component] = row
        
    }

}