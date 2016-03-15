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

    var pname: String? {
        get {
            return self.name
        }
        set {
            self.name = pname
        }
    }
    
    var platitude: String? {
        get {
            return self.latitude
        }
        set {
            self.latitude = platitude
        }
    }
    
    var plongitude: String? {
        get {
            return self.longitude
        }
        set {
            self.longitude = plongitude
        }
    }
}