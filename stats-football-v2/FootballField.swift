//
//  DrawGame.swift
//  stats-football-v2
//
//  Created by grobinson on 10/18/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class FootballField: UIView {
    
    var los = Line(start: CGPoint(x: 7, y: 0),end: CGPoint(x: 7, y: 442))
    var first_down = Line(start: CGPoint(x: 77, y: 0),end: CGPoint(x: 77, y: 442))
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
//        NSLog("MOVED")
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        
        
    }
    
    override func drawRect(rect: CGRect) {
        
        var los_context = UIGraphicsGetCurrentContext()
        var fd_context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineCap(los_context, kCGLineCapRound)
        CGContextSetLineWidth(los_context, 5)
        CGContextBeginPath(los_context)
        
        CGContextMoveToPoint(los_context, los.start.x, los.start.y)
        CGContextAddLineToPoint(los_context, los.end.x, los.end.y)
        CGContextSetStrokeColorWithColor(los_context, UIColor.blueColor().CGColor)
        CGContextStrokePath(los_context)
        
        
        CGContextSetLineCap(fd_context, kCGLineCapRound)
        CGContextSetLineWidth(fd_context, 5)
        CGContextBeginPath(fd_context)
        
        CGContextMoveToPoint(fd_context, first_down.start.x, first_down.start.y)
        CGContextAddLineToPoint(fd_context, first_down.end.x, first_down.end.y)
        CGContextSetStrokeColorWithColor(fd_context, UIColor.yellowColor().CGColor)
        CGContextStrokePath(fd_context)
        
    }

}
