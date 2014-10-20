//
//  CtrlGameView.swift
//  stats-football-v2
//
//  Created by grobinson on 10/17/14.
//  Copyright (c) 2014 wambl. All rights reserved.
//

import UIKit

class CtrlGameView: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var downPK: UIPickerView!
    @IBOutlet weak var field: FootballField!
    
    
    let panRec = UIPanGestureRecognizer()
    
    var firstDownLoc: CGPoint!
    
    var downs = [
        ["1","2","3","4","kick","pat"],
        ["1st","2nd","3rd","4th","KICKOFF","PAT"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Down Picker
    // ========================================================================
    // ========================================================================
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return downs[0].count
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let str = NSAttributedString(string: downs[1][row], attributes: [NSForegroundColorAttributeName : UIColor(red: 231, green: 231, blue: 231, alpha: 1)])
        
        return str
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
    }
    // ========================================================================
    // ========================================================================
    
    
    // Touches
    // ========================================================================
    // ========================================================================
    
    // ========================================================================
    // ========================================================================

}