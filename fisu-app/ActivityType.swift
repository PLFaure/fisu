//
//  ActivityType.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData


class ActivityType: NSManagedObject {

    class func createInManagedObjectContext(moc: NSManagedObjectContext, label: String) -> ActivityType {
        let newActivityType = NSEntityDescription.insertNewObjectForEntityForName("ActivityType", inManagedObjectContext: moc) as! ActivityType
        newActivityType.label = label
        //////////////////////////////////////////
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
            self.label = plabel
        }
    }
}