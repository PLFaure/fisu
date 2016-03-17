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
    
    //Creation of all datas
    var events = [Event]() // Create an empty array of Events
    var activityTypes = [ActivityType]() // Create an empty array of ActivityTypes
    var locations = [Location]() // Create an empty array of Locations
    var accomodations = [Accomodation]()
    var restaurants = [Restaurant]()
    var speakers = [Speaker]()
    
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
        
        
        // Create locations data
        let l = [
            ("43.593333", "3.849431", "Stade de l'assiette"),
            ("43.528198", "3.934645", "La Plage"),
            ("43.632699", "3.862738", "Polyetch"),
            ("43.631113", "3.860338", "2 Place Eugène Bataillon")
        ]
        // Loop through, creating locations
        for (lLatitude, lLongitude, lName) in l {
            // Create an individual locations
            Location.createInManagedObjectContext(moc, name: lName, latitude: lLatitude, longitude: lLongitude)
        }
        fetchLocation()
        
        
        // Create events data
        let ev = [
            ("Tournoi d'Ultimate Frisbee", NSDate(), "Le plus gros tournois du millénaire !", activityTypes[0] , locations[0], SpeakersSet()),
            ("Course Yolo", NSDate(), "Vous allez voir pleuvoir des bananes !", activityTypes[0], locations[1], SpeakersSet())
        ]
        // Loop through, creating events
        for (eventName, eventDate, eventDescr, eventType, eventLoc, eventSpeakers) in ev {
            // Create an individual event
            Event.createInManagedObjectContext(moc, name: eventName, date: eventDate, descr: eventDescr, type: eventType, loc: eventLoc, speakers: eventSpeakers)
        }
        fetchEvent()
        
        // Create accomodations data
        let a = [
            ("Booba Room","Une salle trop fat. En plus il y a une cafetiere.", NSData(),locations[2])
        ]
        //Loop through, creating accomodations
        for (aName, aDescr, aPict, aLoc) in a {
            // Create an individual accomodation
            Accomodation.createInManagedObjectContext(moc, name: aName, descr: aDescr, picture: aPict, loc: aLoc)
        }
        fetchAccomodation()
        
        // Create restaurants data
        let r = [
            ("Le RU","N'y vas pas, c'est pas bon...", NSData(),locations[3])
        ]
        //Loop through, creating restaurants
        for (rName, rDescr, rPict, rLoc) in r {
            // Create an individual restaurant
            Restaurant.createInManagedObjectContext(moc, name: rName, descr: rDescr, picture: rPict, loc: rLoc)
        }
        fetchRestaurant()
        
        ///////////////////////////////////////////////////////////////////////////////////////
        ///////////////////////////////                ICI              ///////////////////////
        ///////////////////////////////////////////////////////////////////////////////////////
        // Create speakers data
        let sp = [
            ("Kenobi", "Obi Wan", "Male", "Jedi Master", "The Force is strong with this one.", "obi.keke@jeditemple.cor", "06 00 00 00 00", "75 rue du ")
        ]
        //Loop through, creating accomodations
        //lastName: String, firstName: String, sex: String, title: String, descr: String, email: String, phone:String, address: String, picture: NSData
        for (rName, rDescr, rPict, rLoc) in r {
            // Create an individual accomodation
            Restaurant.createInManagedObjectContext(moc, name: rName, descr: rDescr, picture: rPict, loc: rLoc)
        }
        fetchSpeaker()
        //////////////////////////////////////////////////////////////////////////////////////
        
        save()
    }
    
    func fetchActivityType() {
        let fetchRequest = NSFetchRequest(entityName: "ActivityType")
        
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [ActivityType] {
                activityTypes = fetchResults
            }
        } catch {
            let nserror = error as NSError
            NSLog("Fetch failed: \(nserror.localizedDescription)")
        }
        
    }
    
    func fetchLocation() {
        let fetchRequest = NSFetchRequest(entityName: "Location")
        
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Location] {
                locations = fetchResults
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
    
    func fetchAccomodation() {
        let fetchRequest = NSFetchRequest(entityName: "Accomodation")
        
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Accomodation] {
                accomodations = fetchResults
            }
        } catch {
            let nserror = error as NSError
            NSLog("Fetch failed: \(nserror.localizedDescription)")
        }
        
    }
    
    func fetchRestaurant() {
        let fetchRequest = NSFetchRequest(entityName: "Restaurant")
        
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Restaurant] {
                restaurants = fetchResults
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

