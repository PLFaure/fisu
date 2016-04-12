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
class Event: NSManagedObject {
    
    /// Creation of an Event in core data.
    /// - parameter moc: NSManagedObjectContext, the managed object context
    /// - parameter name: String, the name of the event
    /// - parameter date: NSDate, the date of the event
    /// - parameter descr: String, the description of the event
    /// - parameter type: ActivityType, the activity type for the event
    /// - parameter loc: Location, the location of the event
    /// - parameter speakers: NSSet, a set listing the speakers of the event
    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, date: NSDate, descr: String, type: ActivityType, loc: Location, speakers: NSSet) -> Event {
        let newEvent = NSEntityDescription.insertNewObjectForEntityForName("Event", inManagedObjectContext: moc) as! Event
        newEvent.pname = name
        newEvent.pdate = date
        newEvent.pdescr = descr
        newEvent.ptype = type
        newEvent.ploc = loc
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
    var pspeakers: NSSet? {
        set {
            self.speaker = newValue
        }
        get {
            return self.speaker
        }
    }
}