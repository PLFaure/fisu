//
//  Location.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData


class Location: NSManagedObject {

    /// the name property
    /// - set: for set the name
    /// - get: for get the name
    var pname: String? {
        get {
            return self.name
        }
        set {
            self.name = pname
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
            self.latitude = platitude
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
            self.longitude = plongitude
        }
    }
}