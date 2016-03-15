//
//  EventsSet.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData

/// Type EventsSet
/// An EventsSets is a collection of Event.
/// An EventsSet is empty if it has no Event.
class EventsSet: NSObject {

    var eventList:[Event?] = []
    
    var peventList: [Event?] {
        get {
            return self.eventList
        }
        set {
            self.eventList = peventList
        }
    }
    
    override init() {
        super.init()
        self.peventList = []
    }
    
    
    /// for determine if an Event is present in an EventsSet.
    /// - parameter e: an object of type Event
    /// - precondition: none
    /// - returns: a boolean, True if the Event is in the EventsSet, else False.
    func isPresent(e: Event) -> Bool {
        var present: Bool = false
        var index: Int = 0
        let n: Int = self.peventList.count
        while (!(present) && (index<n)) {
            if (self.isEqual(e)) {
                present = true
            }
            else {
                index++
            }
        }
        return present
    }
    
    
    /// for add an object of type Event in an EventsSet
    /// - parameter e: an object of type Event
    /// - precondition: the Event musn't already exists in the EventsSet.
    /// - returns: a boolean, True if the Event has been add in the EventsSet, else False.
    func addToList(e: Event) -> Bool {
        self.peventList.append(e)
        return isPresent(e)
    }
    
    
    /// for remove an Event in an EventsSet
    /// - parameter e: an object of type Event
    /// - precondition: the Event must exists in the EventsSet.
    /// - returns: a booleen, True if the Event has been remove, else False.
    func removeFromList(e: Event) -> Bool {
        var b: Bool = false
        var index: Int = 0
        let n: Int = self.peventList.count
        while (!(b) && (index<n)) {
            if (self.isEqual(e)) {
                b = true
            }
            else {
                index++
            }
        }
        if (b) {
            self.peventList.removeAtIndex(index)
            b = !(isPresent(e))
        }
        return b
    }
    
}
