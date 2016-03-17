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
    var activityTypes = [ActivityType]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        // Use optional binding to confirm the managedObjectContext
        let moc = self.managedObjectContext

        // Create activityTypes data
        let at = [
            ("Challenge sportif"),
            ("Symposium")
        ]
        // Loop through, creating activityTypes
        for (atLabel) in at {
            // Create an individual activityTypes
            ActivityType.createInManagedObjectContext(moc, label: atLabel)
        }
        fetchActivityType()
        
        
        // Create events data
        let ev = [
            ("Tournoi d'Ultimate Frisbee", NSDate(), "Le plus gros tournois du millénaire !", activityTypes[0] , Location(), SpeakersSet()),
            ("Course Yolo", NSDate(), "Vous allez voir pleuvoir des bananes !", activityTypes[0], Location(), SpeakersSet())
        ]
        // Loop through, creating events
        for (eventName, eventDate, eventDescr, eventType, eventLoc, eventSpeakers) in ev {
            // Create an individual event
            Event.createInManagedObjectContext(moc, name: eventName, date: eventDate, descr: eventDescr, type: eventType, loc: eventLoc, speakers: eventSpeakers)
        }
        fetchEvent()
        save()
    }
    
    func fetchActivityType() {
        let fetchRequest = NSFetchRequest(entityName: "ActivityType")
        
        // Create a sort descriptor object that sorts on the "label"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "label", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [ActivityType] {
                activityTypes = fetchResults
            }
        } catch {
            let nserror = error as NSError
            NSLog("Fetch failed: \(nserror.localizedDescription)")
        }
        
    }
    
    func fetchEvent() {
        let fetchRequest = NSFetchRequest(entityName: "Event")
        
        // Create a sort descriptor object that sorts on the "name"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Event] {
                events = fetchResults
            }
        } catch {
            let nserror = error as NSError
            NSLog("Fetch failed: \(nserror.localizedDescription)")
        }

    }
    
    func save() {
        do {
            try self.managedObjectContext.save()
        } catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort() // Causes the application to generate a crash log and terminate. You should not use this function in a shipping application.
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    
    
    
}

