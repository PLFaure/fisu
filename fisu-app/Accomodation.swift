//
//  Accomodation.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData

/// Type Accomodation.
class Accomodation: NSManagedObject {
    
    /// Creation of an Accomodation in core data.
    /// - parameter moc: NSManagedObjectContext, the managed object context
    /// - parameter name: String, the name of the accomodation
    /// - parameter descr: String, the description of the accomodation
    /// - parameter picture: NSData, the picture of the accomodation
    /// - parameter loc: Location, the location of the accomodation
    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, descr: String, picture: NSData, loc: Location) -> Accomodation {
        let newAccomodation = NSEntityDescription.insertNewObjectForEntityForName("Accomodation", inManagedObjectContext: moc) as! Accomodation
        newAccomodation.pname = name
        newAccomodation.pdescr = descr
        newAccomodation.ppicture = picture
        newAccomodation.plocation = loc
        return newAccomodation
    }
    
    
    /// the name property
    /// - set: for set the name
    /// - get: for get the name
    var pname: String? {
        get {
            return self.name
        }
        set {
            self.name = newValue
        }
    }
    
    /// the description property
    /// - set: for set the description
    /// - get: for get the description
    var pdescr: String? {
        get {
            return self.descr
        }
        set {
            self.descr = newValue
        }
    }
    
    /// the picture property
    /// - set: for set the picture
    /// - get: for get the picture
    var ppicture: NSData? {
        get {
            return self.picture
        }
        set {
            self.picture = newValue
        }
    }
    
    /// the location property
    /// - set: for set the location
    /// - get: for get the location
    var plocation: Location? {
        get {
            return self.location
        }
        set {
            self.location = newValue
        }
    }
}