//
//  dragXView.swift
//  stats-football-v2
//
//  Created by grobinson on 10/19/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class dragXView: UIView {

    var lastLocation:CGPoint = CGPointMake(0, 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Initialization code
        var panRecognizer = UIPanGestureRecognizer(target:self, action:"detectPan:")
        self.gestureRecognizers = [panRecognizer]
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectPan(recognizer:UIPanGestureRecognizer) {
        
        NSLog("PAN")
        var translation  = recognizer.translationInView(self.superview!)
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        // Promote the touched view
        self.superview?.bringSubviewToFront(self)
        
        // Remember original location
        lastLocation = self.center
        
    }
    
}
