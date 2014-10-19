//
//  CtrlGameView.swift
//  stats-football-v2
//
//  Created by grobinson on 10/17/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class CtrlGameView: UIViewController {
    
    @IBOutlet weak var field: DrawOnField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var fieldSingleTap = UITapGestureRecognizer(target: self, action: "field_1_Tap")
//        self.field.addGestureRecognizer(fieldSingleTap)
//        
//        var fieldDoubleTap = UITapGestureRecognizer(target: self, action: "field_2_Tap")
//        fieldDoubleTap.numberOfTapsRequired = 2
//        self.field.addGestureRecognizer(fieldDoubleTap)
//        
//        fieldSingleTap.requireGestureRecognizerToFail(fieldDoubleTap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func field_1_Tap(){
        
        JP("ONE TAP")
        
//        var FieldDraw: DrawOnField = field as DrawOnField
//        
//        FieldDraw.tap_num++
        
    }
    
    func field_2_Tap(){
        
        JP("TWO TAP")
        
    }
    

}