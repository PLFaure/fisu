//
//  Event.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData


class Event: NSManagedObject {
    
    private var speakers: SpeakersSet?
    
    var pdate: NSDate? {
        set {
            self.date = pdate
        }
        get {
            return self.date
        }
    }
    
    var pname: String? {
        set {
            self.name = pname
        }
        get {
            return self.name
        }
    }
    
    var pdescr: String? {
        set {
            self.descr = pdescr
        }
        get {
            return self.descr
        }
    }
    
    var ptype: ActivityType? {
        set {
            self.activityType = ptype
        }
        get {
            return self.activityType
        }
    }
    
    var ploc: Location? {
        set {
            self.location = ploc
        }
        get {
            return self.location
        }
    }
    
    var pspeakers: SpeakersSet? {
        set {
            self.speakers = pspeakers
        }
        get {
            return self.speakers
        }
    }
}