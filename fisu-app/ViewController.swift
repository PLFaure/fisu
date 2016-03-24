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
    var accomodations = [Accomodation]() // Create an empty array of Accomodations
    var restaurants = [Restaurant]() // Create an empty array of Restaurants
    var speakers = [Speaker]() // Create an empty array of Speakers
    var users = [User]() // Create an empty array of Users
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        // Use optional binding to confirm the managedObjectContext
        let moc = self.managedObjectContext
        fetchActivityType()
        fetchLocation()
        fetchSpeaker()
        fetchEvent()
        fetchAccomodation()
        fetchRestaurant()
        fetchUser()
        
        // Create activityTypes data
        let at = [ //think to insert the elements in the alphabetical order (on label), for more visibility
            ("Challenge sportif"),
            ("Symposium")
        ]
        // Loop through, creating activityTypes
        for (atLabel) in at {
            if !isPresentActType(self.activityTypes, acLabel: atLabel) { //if an activity type with this label does not exists
                // Create an individual activityTypes
                ActivityType.createInManagedObjectContext(moc, label: atLabel)
            }
            
        }
        fetchActivityType() // fetch the new ActivityType into the array activityTypes
        
        
        // Create locations data
        let l = [ //think to insert the elements in the alphabetical order (on name), for more visibility
            ("43.631113", "3.860338", "2 Place Eugène Bataillon"),
            ("43.528198", "3.934645", "La Plage"),
            ("43.632699", "3.862738", "Polyetch"),
            ("43.593333", "3.849431", "Stade de l'assiette")
        ]
        // Loop through, creating locations
        for (lLatitude, lLongitude, lName) in l {
            if !isPresentLocation(self.locations, locName: lName) { //if a location with this name does not exists
                // Create an individual locations
                Location.createInManagedObjectContext(moc, name: lName, latitude: lLatitude, longitude: lLongitude)
            }
            
        }
        fetchLocation() // fetch the new Location into the array locations

        
        // Create speakers data
        let sp = [ //think to insert the elements in the alphabetical order (on lastName), for more visibility
            ("Kenobi", "Obi-Wan", "Male", "Jedi Master", "The Force is strong with this one.", "obi.keke@jeditemple.cor", "06 00 00 00 00", "75 rue de la Lumiere", UIImagePNGRepresentation(UIImage(named: "obiwan.png")!)),
            ("Mario", "Mario", "Male", "Jumpman", "It's me!", "mario@nintendo.io", "06 00 00 00 01", "1 avenue des Champis", UIImagePNGRepresentation(UIImage(named: "mario.png")!))
        ]
        //Loop through, creating accomodations
        for (spLastName, spFirstName, spSex, spTitle, spDescr, spEmail, spPhone, spAddress, spPict) in sp {
            if !isPresentSpeaker(self.speakers, spLastName: spLastName, spFirstName: spFirstName) { //if a speaker with these first and last names does not exists
                // Create an individual accomodation
                Speaker.createInManagedObjectContext(moc, lastName: spLastName, firstName: spFirstName, sex: spSex, title: spTitle, descr: spDescr, email: spEmail, phone: spPhone, address: spAddress, picture: spPict!)
            }
        }
        fetchSpeaker() // fetch the new Speaker into the array speakers
        
        var spSet1 : [Speaker] = []
        spSet1.append(speakers[0]) //add Obi-Wan to spSet1
        var spSet2 : [Speaker] = []
        spSet2.append(speakers[1]) //add Mario to spSet2
        
        // Create events data
        let ev = [ //think to insert the elements in the alphabetical order (on name), for more visibility
            ("Course Yolo", NSDate(), "Vous allez voir pleuvoir des bananes !", activityTypes[0], locations[1], spSet2),
            ("Tournoi d'Ultimate Frisbee", NSDate(), "Le plus gros tournois du millénaire !", activityTypes[0] , locations[3], spSet1)
        ]
        // Loop through, creating events
        for (eventName, eventDate, eventDescr, eventType, eventLoc, eventSpeakers) in ev {
            if !isPresentEvent(self.events, evName: eventName) { //if an event with this name does not exists
                // Create an individual event
                Event.createInManagedObjectContext(moc, name: eventName, date: eventDate, descr: eventDescr, type: eventType, loc: eventLoc, speakers: NSSet(array: eventSpeakers))
            }
        }
        fetchEvent() // fetch the new Event into the array events
        
        // Create accomodations data
        let a = [ //think to insert the elements in the alphabetical order (on name), for more visibility
            ("Booba Room","Une salle trop fat. En plus il y a une cafetiere.", NSData(),locations[2])
        ]
        //Loop through, creating accomodations
        for (aName, aDescr, aPict, aLoc) in a {
            if !isPresentAccomodation(self.accomodations, accName: aName) { //if an accomodation with this name does not exists
                // Create an individual accomodation
                Accomodation.createInManagedObjectContext(moc, name: aName, descr: aDescr, picture: aPict, loc: aLoc)
            }
        }
        fetchAccomodation() // fetch the new Accomodation into the array accomodations
        
        // Create restaurants data
        let r = [ //think to insert the elements in the alphabetical order (on name), for more visibility
            ("MacDo","Tout ce que t'aimes !!", NSData(),locations[1]),
            ("Le RU","N'y vas pas, c'est pas bon...", NSData(),locations[0])
        ]
        //Loop through, creating restaurants
        for (rName, rDescr, rPict, rLoc) in r {
            if !isPresentRestaurant(self.restaurants, restName: rName) { //if a restaurant with this name does not exists
                // Create an individual restaurant
                Restaurant.createInManagedObjectContext(moc, name: rName, descr: rDescr, picture: rPict, loc: rLoc)
            }
        }
        fetchRestaurant() // fetch the new Restaurant into the array restaurants
        
        // Create speakers data
        let usr = [ //think to insert the elements in the alphabetical order (on username), for more visibility
            ("cricridu34", "rspklsd", "Fiorio", "Christophe", "Male", "christophe.fiorio@lirmm.fr", "04 67 41 86 41", "Français", EventsSet())
        ]
        //Loop through, creating accomodations
        for (usrUserName, usrPass, usrLastName, usrFisrtName, usrSex, usrEmail, usrPhone, usrNat, usrEvts) in usr {
            // Create an individual accomodation
            User.createInManagedObjectContext(moc, userName: usrUserName, password: usrPass, lastName: usrLastName, firstName: usrFisrtName, sex: usrSex, email: usrEmail, phone: usrPhone, nationality: usrNat, events: usrEvts)
        }
        fetchUser() // fetch the new User into the array users
        
        save() //save the data sets
        
        /////////A ENLEVER /////////
        print(self.restaurants[0].name)
        print(self.locations[0].name)
        print(self.accomodations[0].name)
        print(self.speakers[0].lastName)
        print(self.users[0].lastName)
        print(self.activityTypes[0].label)
        print(self.events[0].name)
        /////////JUSQUE LA/////////
    }
    
    func fetchActivityType() { // this fonction fetch a new ActivityType into activityTypes array
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
    
    func fetchLocation() { // this fonction fetch a new Location into locations array
        let fetchRequest = NSFetchRequest(entityName: "Location")
        
        // Create a sort descriptor object that sorts on the "name"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Location] {
                locations = fetchResults
            }
        } catch {
            let nserror = error as NSError
            NSLog("Fetch failed: \(nserror.localizedDescription)")
        }
        
    }
    
    func fetchEvent() { // this fonction fetch a new Event into events array
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
    
    func fetchAccomodation() { // this fonction fetch a new Accomodation into accomodations array
        let fetchRequest = NSFetchRequest(entityName: "Accomodation")
        
        // Create a sort descriptor object that sorts on the "name"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Accomodation] {
                accomodations = fetchResults
            }
        } catch {
            let nserror = error as NSError
            NSLog("Fetch failed: \(nserror.localizedDescription)")
        }
        
    }
    
    func fetchRestaurant() { // this fonction fetch a new Restaurant into restaurants array
        let fetchRequest = NSFetchRequest(entityName: "Restaurant")
        
        // Create a sort descriptor object that sorts on the "name"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Restaurant] {
                restaurants = fetchResults
            }
        } catch {
            let nserror = error as NSError
            NSLog("Fetch failed: \(nserror.localizedDescription)")
        }
        
    }
    
    func fetchSpeaker() { // this fonction fetch a new Speaker into speakers array
        let fetchRequest = NSFetchRequest(entityName: "Speaker")
        
        // Create a sort descriptor object that sorts on the "lastName"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "lastName", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Speaker] {
                speakers = fetchResults
            }
        } catch {
            let nserror = error as NSError
            NSLog("Fetch failed: \(nserror.localizedDescription)")
        }
        
    }

    
    func fetchUser() { // this fonction fetch a new User into users array
        let fetchRequest = NSFetchRequest(entityName: "User")
        
        // Create a sort descriptor object that sorts on the "userName"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "userName", ascending: true)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        do {
            if let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [User] {
                users = fetchResults
            }
        } catch {
            let nserror = error as NSError
            NSLog("Fetch failed: \(nserror.localizedDescription)")
        }
        
    }
    
    func save() { // save the current data set
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


   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueResto" {
            if let nextScene = segue.destinationViewController as? TableViewControllerResto{
                nextScene.restaurantsArray = self.restaurants
            }
        } else if segue.identifier == "segueEvents" {
            if let nextScene = segue.destinationViewController as? TableViewControllerEvents{

                nextScene.eventsArray = self.events
        }
    }
    }
    
    //the following functions are defined to control the insertion of elements into the class arrays variables above
    func isPresentEvent(evArray: [Event], evName: String) -> Bool { //function for the events
        let n = evArray.count
        var p = false
        var i = 0
        while (i < n) && !p {
            if evArray[i].name == evName {
                p = true
            } else {
                i++
            }
        }
        return p
    }
    func isPresentActType(acArray: [ActivityType], acLabel: String) -> Bool { //function for the activity types
        let n = acArray.count
        var p = false
        var i = 0
        while (i < n) && !p {
            if acArray[i].label == acLabel {
                p = true
            } else {
                i++
            }
        }
        return p
    }
    func isPresentLocation(locArray: [Location], locName: String) -> Bool { //function for the locations
        let n = locArray.count
        var p = false
        var i = 0
        while (i < n) && !p {
            if locArray[i].name == locName {
                p = true
            } else {
                i++
            }
        }
        return p
    }
    func isPresentAccomodation(accArray: [Accomodation], accName: String) -> Bool { //function for the accomodations
        let n = accArray.count
        var p = false
        var i = 0
        while (i < n) && !p {
            if accArray[i].name == accName {
                p = true
            } else {
                i++
            }
        }
        return p
    }
    func isPresentRestaurant(restArray: [Restaurant], restName: String) -> Bool { //function for the restaurants
        let n = restArray.count
        var p = false
        var i = 0
        while (i < n) && !p {
            if restArray[i].name == restName {
                p = true
            } else {
                i++
            }
        }
        return p
    }
    func isPresentSpeaker(spArray: [Speaker], spLastName: String, spFirstName: String) -> Bool { //function for the speakers
        let n = spArray.count
        var p = false
        var i = 0
        while (i < n) && !p {
            if (spArray[i].lastName == spLastName) && (spArray[i].firstName == spFirstName) {
                p = true
            } else {
                i++
            }
        }
        return p
    }
    func isPresentUser(usrArray: [User], usrName: String) -> Bool { //function for the users
        let n = usrArray.count
        var p = false
        var i = 0
        while (i < n) && !p {
            if (usrArray[i].userName == usrName) {
                p = true
            } else {
                i++
            }
        }
        return p
    }
    
}

