//
//  OpenTimeLogController.swift
//  LeqnAppAgain
//
//  Created by Urmila Sampathkumar on 6/17/15.
//  Copyright (c) 2015 Urmila Sampathkumar. All rights reserved.
//
import UIKit
import Foundation

class OpenTimeLogController: UIViewController {
    
    @IBOutlet weak var timesSegment: UISegmentedControl!
    
    
    @IBAction func timesSegmentSelected(sender: AnyObject) {
        
        switch timesSegment.selectedSegmentIndex
        {
        case 0:
            openTimeCOntainer.hidden = false
            prevTimeContainer.hidden = true
        case 1:
            openTimeCOntainer.hidden = true
            prevTimeContainer.hidden = false
        default:
            break;
        }
    }
    
    
    
    @IBOutlet weak var openTimeCOntainer: UIView!
    
    
    @IBOutlet weak var prevTimeContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openTimeCOntainer.hidden = false
        prevTimeContainer.hidden = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
}