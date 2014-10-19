//
//  CtrlTeam.swift
//  stats-football-v2
//
//  Created by grobinson on 10/16/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit
import CoreData

class CtrlTeam: UIViewController {
    
    // Outlets
    // ================================================
    // ================================================
    @IBOutlet weak var nameTXT: UITextField!
    @IBOutlet weak var abbTXT: UITextField!
    
    var id: String = ""
    var full_name: String = ""
    var short_name: String = ""
    
    var existingTeam: NSManagedObject!
    
    @IBAction func cancelTP(sender: UIBarButtonItem) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    @IBAction func saveTP(sender: UIBarButtonItem) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        
        let contxt: NSManagedObjectContext = appDel.managedObjectContext!
        let en = NSEntityDescription.entityForName("Teams", inManagedObjectContext: contxt)
        
        if existingTeam == nil {
            
            var newTeam = TeamsModel(entity: en!, insertIntoManagedObjectContext: contxt)
            
            var a = Int64(NSDate().timeIntervalSince1970*100000)
            var id_string: String = "\(a)"
            
            newTeam.id = id_string
            newTeam.full_name = nameTXT.text
            newTeam.short_name = abbTXT.text
            
        } else {
            
            existingTeam.setValue(id as String, forKey: "id")
            existingTeam.setValue(nameTXT.text as String, forKey: "full_name")
            existingTeam.setValue(abbTXT.text as String, forKey: "short_name")
            
        }
        
        contxt.save(nil)
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    // ================================================
    // ================================================
    
    
    // View Did Load
    // ================================================
    // ================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if existingTeam != nil {
            
            nameTXT.text = full_name
            abbTXT.text = short_name
            
        }
        
    }
    // ================================================
    // ================================================
    
    
    // Memory Warning
    // ================================================
    // ================================================
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // ================================================
    // ================================================

}
