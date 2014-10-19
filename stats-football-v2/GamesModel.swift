//
//  GamesModel.swift
//  stats-football-v2
//
//  Created by grobinson on 10/16/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit
import CoreData

@objc(GamesModel)
class GamesModel: NSManagedObject {
   
    @NSManaged var id: String
    @NSManaged var away_id: String
    @NSManaged var home_id: String
    @NSManaged var event_date: NSDate
    
}
