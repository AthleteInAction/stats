//
//  UsersModel.swift
//  stats-football-v2
//
//  Created by grobinson on 10/16/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit
import CoreData

@objc(TeamsModel)
class TeamsModel: NSManagedObject {
    
    @NSManaged var id: String
    @NSManaged var full_name: String
    @NSManaged var short_name: String
   
}