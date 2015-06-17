//
//  FirstViewController.swift
//  LeqnAppAgain
//
//  Created by Urmila Sampathkumar on 6/8/15.
//  Copyright (c) 2015 Urmila Sampathkumar. All rights reserved.
//

import UIKit
import Foundation

var notification_switch:Boolean = 0;

class TimeLogViewController: UIViewController {

    @IBOutlet weak var clockInBtn: UIButton!
    
    
    @IBOutlet weak var currentDateLbl: UILabel!
    
    
    @IBAction func ClockInClicked(sender: AnyObject) {
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getDisplayDate();
       //var helloWorldTimer = NSTimer.scheduledTimerWithTimeInterval(30, target: self, selector: Selector("setFireDate"), userInfo: nil, repeats: true);
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"drawAShape:", name: "actionOnePressed", object: nil);
        setFireDate();
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func isNotificationEnabled(fire_date:NSDate)
    {
        //var fire_date = NSDate();
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate:  NSDate())
        let currentHour = components.hour
        let currentMinutes = components.minute
        if(currentHour < 9 || currentHour > 18)
            {
                //turn off notification
                notification_switch = 0;
            }
        else
            {
                notification_switch = 1;
            
            }
        notification_switch = 0;
       


    }
    
    func createNotification(fire_date:NSDate)
    {
        var notification:UILocalNotification = UILocalNotification()
        notification.category = "FIRST_CATEGORY"
        notification.alertBody = "Gentle Reminder: Please log you time for the past 15 mins"
        notification.fireDate = fire_date;
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    
    func setFireDate()
    {
    
        var fire_date:NSDate = NSDate();
        println("New DAte:::");
        println(fire_date);
        var calendar = NSCalendar.currentCalendar();
        var components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate:  NSDate());
        var currentHour = components.hour
        var currentMinutes = components.minute
        
        println("currentHour::");
        println( currentHour);
        println(notification_switch);
        var number_of_alerts_per_day:Int = 32;
        var mod_val:Int;
        var mins_to_add:Int = 0;
        
        
        for var index = 0; index < number_of_alerts_per_day; ++index
        {
            components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate:  fire_date);
            currentMinutes = components.minute;
            currentHour = components.hour;
            mod_val = currentMinutes % 15;
            isNotificationEnabled(fire_date)
            if(notification_switch == 1)
            {
                
                /*if((mod_val == 0 || currentMinutes == 0))
                {
                    createNotification(fire_date);
                    //components.minute = components.minute + 15;
                    mins_to_add = 15;
                    
                }
                else
                {
                   mins_to_add = 15 - mod_val;
                }*/
                
                mins_to_add = 15 - mod_val;
                println("date before::::")
                println(fire_date);
                fire_date = calendar.dateByAddingUnit(.CalendarUnitMinute, value: mins_to_add, toDate: fire_date, options: nil)!
                println("date After Add::::");
                println(fire_date);
                println("Registering next notification:::")
                createNotification(fire_date);
            }
            else
            {
                break;
            }
        }
    

    }
    
    
    
    
    func drawAShape(notification:NSNotification){
        var view:UIView = UIView(frame:CGRectMake(10, 10, 100, 100))
        view.backgroundColor = UIColor.redColor()
        
        self.view.addSubview(view)
        
    }
    
    
    func sayHello()
    {
        NSLog("hello World");
    }
    
    
    func getDisplayDate() ->NSString
    {
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        var stringValue = formatter.stringFromDate(date)
        println(stringValue);
        currentDateLbl.text = stringValue;
        return stringValue;
        
    }

}

