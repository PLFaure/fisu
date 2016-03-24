//
//  Event.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData

/// Type Event.
/// An Event is composed by a date, a name, a description, a type, a location and one (or more) speaker(s).
class Event: NSManagedObject {

    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, date: NSDate, descr: String, type: ActivityType, loc: Location, speakers: SpeakersSet) -> Event {
        //function definition
        let newEvent = NSEntityDescription.insertNewObjectForEntityForName("Event", inManagedObjectContext: moc) as! Event
        
        newEvent.name = name
        newEvent.date = date
        newEvent.descr = descr
        newEvent.activityType = type
        newEvent.location = loc
        newEvent.pspeakers = speakers
        
        return newEvent
    }
    
   
    /// the date property
    /// - set: for set the date
    /// - get: for get the date
    var pdate: NSDate? {
        set {
            self.date = newValue
        }
        get {
            return self.date
        }
    }
    
    /// the name property
    /// - set: for set the name
    /// - get: for get the name
    var pname: String? {
        set {
            self.name = newValue
        }
        get {
            return self.name
        }
    }
    
    /// the description property
    /// - set: for set the description
    /// - get: for get the description
    var pdescr: String? {
        set {
            self.descr = newValue
        }
        get {
            return self.descr
        }
    }
    
    /// the activity type property
    /// - set: for set the activity type
    /// - get: for get the activity type
    var ptype: ActivityType? {
        set {
            self.activityType = newValue
        }
        get {
            return self.activityType
        }
    }
   
    /// the location property
    /// - set: for set the location
    /// - get: for get the location
    var ploc: Location? {
        set {
            self.location = newValue
        }
        get {
            return self.location
        }
    }
    
    /// the SpeakersSet property
    /// - set: for set the SpeakersSet
    /// - get: for get the SpeakersSet
    var pspeakers: SpeakersSet? {
        set {
            self.speaker = newValue
        }
        get {
            return self.speaker
        }
    }
}