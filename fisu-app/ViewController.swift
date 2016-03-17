//
//  ViewController.swift
//  fisu-app
//
//  Created by pierre-louis faure on 04/02/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    // Create an empty array of Events
    var events = [Event]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Use optional binding to confirm the managedObjectContext
        let moc = self.managedObjectContext

        // Create events datas
        var events = [
            ("Tournoi d'Ultimate Frisbee", NSDate(), "Le plus gros tournois du millénaire !", nil, nil, []),
            ("Course Yolo", NSDate(), "Vous allez voir pleuvoir des bananes !", nil, nil, [])
        ]
        // Loop through, creating events
        for (eventName, eventDate, eventDescr, eventType, eventLoc, eventSpeakers) in events {
            // Create an individual event
            Event.createInManagedObjectContext(moc,name: eventName, date: eventDate, descr: eventDescr, type: eventType, loc: eventLoc, speakers: eventSpeakers)
        }
        
        fetchLog()
    }
    
    func fetchLog() {
        let fetchRequest = NSFetchRequest(entityName: "Event")
        if let fetchResults = managedObjectContext.executeFetchRequest(fetchRequest, error: nil) as? [Event] {
            events = fetchResults
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

