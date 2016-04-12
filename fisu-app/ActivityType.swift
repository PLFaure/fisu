//
//  ActivityType.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData

/// Type ActivityType.
class ActivityType: NSManagedObject {

    /// Creation of an ActivityType in core data.
    /// - parameter moc: NSManagedObjectContext, the managed object context
    /// - parameter label: String, the label of the activity type
    class func createInManagedObjectContext(moc: NSManagedObjectContext, label: String) -> ActivityType {
        let newActivityType = NSEntityDescription.insertNewObjectForEntityForName("ActivityType", inManagedObjectContext: moc) as! ActivityType
        newActivityType.plabel = label
        return newActivityType
    }
    
    /// the label property
    /// - set: for set the label
    /// - get: for get the label
    var plabel: String? {
        get {
            return self.label
        }
        set {
            self.label = newValue
        }
    }
}