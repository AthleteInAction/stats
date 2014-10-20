//
//  testDrag.swift
//  stats-football-v2
//
//  Created by grobinson on 10/19/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class ButtonDragX: UIButton {
    
    var o_center: CGPoint!
    var spot: CGPoint!
    
//    var lineColor: UIColor = UIColor.yellowColor()
//    var line = Line(start: CGPoint(x: 10, y: 0),end: CGPoint(x: 10, y: 442))

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        o_center = self.center
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
        let n_point = touches.anyObject()?.locationInView(self.superview)
        
        var new_x = n_point!.x
        
        var snap_x = round(new_x/7)*7
        
        self.center = CGPointMake(snap_x, o_center.y)
        
//        line.start.x = snap_x
//        line.end.x = snap_x
        
    }
    
    override func drawRect(rect: CGRect) {
        
        
        
    }

}