//
//  Location.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData

/// Type Location.
class Location: NSManagedObject {

    /// Creation of a Location in core data.
    /// - parameter moc: NSManagedObjectContext, the managed object context
    /// - parameter name: String, the name of the location
    /// - parameter latitude: String, the latitude of the location
    /// - parameter longitude: String, the longitude of the location
    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, latitude: String, longitude: String) -> Location {
        let newLocation = NSEntityDescription.insertNewObjectForEntityForName("Location", inManagedObjectContext: moc) as! Location
        newLocation.pname = name
        newLocation.platitude = latitude
        newLocation.plongitude = longitude
        return newLocation
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
    
    /// the latitude property
    /// - set: for set the latitude
    /// - get: for get the latitude
    var platitude: String? {
        get {
            return self.latitude
        }
        set {
            self.latitude = newValue
        }
    }
    
    /// the longitude property
    /// - set: for set the longitude
    /// - get: for get the longitude
    var plongitude: String? {
        get {
            return self.longitude
        }
        set {
            self.longitude = newValue
        }
    }
}