//
//  SecondViewController.swift
//  LeqnAppAgain
//
//  Created by Urmila Sampathkumar on 6/8/15.
//  Copyright (c) 2015 Urmila Sampathkumar. All rights reserved.
//

import UIKit
import CoreData


class ProfileViewController: UIViewController {
    
    
    

    @IBOutlet weak var userFirstname: UITextField!
    
    
    @IBOutlet weak var userLastName: UITextField!

    
    @IBOutlet weak var role: UITextField!
    
    
    @IBOutlet weak var mgrFirstname: UITextField!
    
    
    @IBOutlet weak var mgrLastname: UITextField!
    
    
    @IBOutlet weak var city: UITextField!
    
    
    @IBOutlet weak var building: UITextField!
    
    
    @IBOutlet weak var floor: UITextField!
    
    
    @IBOutlet weak var uiSegcntrlObj: UISegmentedControl!
    
    
    
    @IBAction func UpdateProfiledetails(sender: UISegmentedControl) {
       if( sender.selectedSegmentIndex == 0 )
       {
       
        let timeLogViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TimeLogViewController") as! TimeLogViewController
        self.navigationController?.pushViewController(timeLogViewController, animated: true)
       }
        else if(sender.selectedSegmentIndex == 1)
       {
        println("save clicked:::::" + role.text);
        
        
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.managedObjectContext!

        let entity =  NSEntityDescription.entityForName("UserDetails",
            inManagedObjectContext:
            context)
        let person = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:context)
        person.setValue(userFirstname.text, forKey: "firstName");
        person.setValue(userLastName.text, forKey: "lastName");
        person.setValue(mgrFirstname.text, forKey: "mgrfname");
        person.setValue(mgrLastname.text, forKey: "mgrlname");
        person.setValue(role.text, forKey: "role");
         person.setValue(city.text, forKey: "city");
         person.setValue(building.text, forKey: "building");
         person.setValue(floor.text, forKey: "location");
        
        
        var error : NSError? = nil
        if !context.save(&error) {
            NSLog("Unresolved error \(error), \(error!.userInfo)")
            abort();
        }
        
     
       }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dismiss keyboard on tap
        var tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        self.view.addGestureRecognizer(tap)
        
        
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context:NSManagedObjectContext = appDel.managedObjectContext!

        let fetchRequest = NSFetchRequest(entityName:"UserDetails")
        
        //3
        var error: NSError?
        
        let fetchedResults =
        context.executeFetchRequest(fetchRequest,
            error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            //println(results[0].valueForKey("firstName"));
           // if results == nil || results[0] == nil
            //{
                
            //}
            //else
            //{
            /*    userFirstname.text = results[0].valueForKey("firstName");
                userLastName.text = results[0].valueForKey("lastName");
                mgrFirstname.text = results[0].valueForKey("mgrfname");
                mgrLastname.text = results[0].valueForKey("mgrlname");
                role.text = results[0].valueForKey("role");
                city.text = results[0].valueForKey("city");
                building.text = results[0].valueForKey("building");
                floor.text = results[0].valueForKey("location");*/
           // }
        } else {
            println("Could not fetch \(error), \(error!.userInfo)")
        }
        
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func DismissKeyboard(){
        self.view.endEditing(true)
    }

}

