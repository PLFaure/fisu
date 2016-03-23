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
    var users = [User]()
    
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

        
        // Create speakers data
        let sp = [
            ("Kenobi", "Obi-Wan", "Male", "Jedi Master", "The Force is strong with this one.", "obi.keke@jeditemple.cor", "06 00 00 00 00", "75 rue de la Lumiere", UIImagePNGRepresentation(UIImage(named: "obiwan.png")!)),
            ("Mario", "Mario", "Male", "Jumpman", "It's me!", "mario@nintendo.io", "06 00 00 00 01", "1 avenue des Champis", UIImagePNGRepresentation(UIImage(named: "mario.png")!))
        ]
        //Loop through, creating accomodations
        for (spLastName, spFirstName, spSex, spTitle, spDescr, spEmail, spPhone, spAddress, spPict) in sp {
            // Create an individual accomodation
            //lastName: String, firstName: String, sex: String, title: String, descr: String, email: String, phone:String, address: String, picture: NSData
            Speaker.createInManagedObjectContext(moc, lastName: spLastName, firstName: spFirstName, sex: spSex, title: spTitle, descr: spDescr, email: spEmail, phone: spPhone, address: spAddress, picture: spPict!)
        }
        fetchSpeaker()
        
        let spSet1 = SpeakersSet()
        spSet1.addToList(speakers[0]) //add Obi-Wan to spSet1
        let spSet2 = SpeakersSet()
        spSet2.addToList(speakers[1]) //add Mario to spSet2
        
        // Create events data
        let ev = [
            ("Tournoi d'Ultimate Frisbee", NSDate(), "Le plus gros tournois du millénaire !", activityTypes[0] , locations[0], spSet1),
            ("Course Yolo", NSDate(), "Vous allez voir pleuvoir des bananes !", activityTypes[0], locations[1], spSet2)
        ]
        // Add speakersSets
        ev[0].5.addToList(speakers[0])
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
        
        // Create speakers data
        let usr = [
            ("cricridu34", "rspklsd", "Fiorio", "Christophe", "Male", "christophe.fiorio@lirmm.fr", "04 67 41 86 41", "Français", EventsSet())
        ]
        //Loop through, creating accomodations
        for (usrUserName, usrPass, usrLastName, usrFisrtName, usrSex, usrEmail, usrPhone, usrNat, usrEvts) in usr {
            // Create an individual accomodation
            User.createInManagedObjectContext(moc, userName: usrUserName, password: usrPass, lastName: usrLastName, firstName: usrFisrtName, sex: usrSex, email: usrEmail, phone: usrPhone, nationality: usrNat, events: usrEvts)
        }
        fetchUser()
        
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
    
    func fetchSpeaker() {
        let fetchRequest = NSFetchRequest(entityName: "Speaker")
        
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Speaker] {
                speakers = fetchResults
            }
        } catch {
            let nserror = error as NSError
            NSLog("Fetch failed: \(nserror.localizedDescription)")
        }
        
    }

    
    func fetchUser() {
        let fetchRequest = NSFetchRequest(entityName: "User")
        
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [User] {
                users = fetchResults
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

