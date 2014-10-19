//
//  DrawGame.swift
//  stats-football-v2
//
//  Created by grobinson on 10/18/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class DrawOnField: UIView {
    
    var lines: [Line] = []
    var last_point: CGPoint!
    var moved = false as Bool
    var tap_num = 0 as Int
    var lineColor: UIColor = UIColor(red: 93, green: 207, blue: 255, alpha: 1)
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        var touch = touches.anyObject()!
        
        tap_num = touch.tapCount
        
        lines = []
        
        last_point = touches.anyObject()?.locationInView(self)
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        JP("TAP: \(tap_num)")
        
        moved = true
        
        var new_point = touches.anyObject()?.locationInView(self)
        
        if tap_num == 1 {
            
            lineColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            
        } else if tap_num == 2 {
            
            lineColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
            
        }
        
        lines.append(Line(start: last_point,end: new_point!))
        last_point = new_point
        
        self.setNeedsDisplay()
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        JP("TOUCHES END: \(tap_num)")
        
        tap_num = 0
        
    }
    
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetLineWidth(context, 5)
        
        for line in lines {
            
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
            CGContextSetStrokeColorWithColor(context, lineColor.CGColor)
            CGContextStrokePath(context)
            
        }
        
    }

}
