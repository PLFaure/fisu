//
//  Restaurant.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData

/// Type Restaurant.
class Restaurant: NSManagedObject {

    /// Creation of a Restaurant in core data.
    /// - parameter moc: NSManagedObjectContext, the managed object context
    /// - parameter name: String, the name of the restaurant
    /// - parameter descr: String, the description of the restaurant
    /// - parameter picture: NSData, the picture of the restaurant
    /// - parameter loc: Location, the location of the restaurant
    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, descr: String, picture: NSData, loc: Location) -> Restaurant {
        let newRestaurant = NSEntityDescription.insertNewObjectForEntityForName("Restaurant", inManagedObjectContext: moc) as! Restaurant
        newRestaurant.pname = name
        newRestaurant.pdescr = descr
        newRestaurant.ppicture = picture
        newRestaurant.plocation = loc
        return newRestaurant
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
