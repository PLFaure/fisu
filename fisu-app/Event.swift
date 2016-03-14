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

// Insert code here to add functionality to your managed object subclass

    func setDate(d: NSDate) {
        self.date = d
    }
    
    func getDate() -> NSDate {
      return self.date
    }
}
@NSManaged var date: NSDate?
@NSManaged var descr: String?
@NSManaged var name: String?
@NSManaged var activityType: NSManagedObject?
@NSManaged var eventsSet: NSManagedObject?
@NSManaged var location: NSManagedObject?
@NSManaged var speakersSet: NSManagedObject?