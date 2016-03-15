//
//  Accomodation.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData


class Accomodation: NSManagedObject {
    
    var pname: String? {
        get {
            return self.name
        }
        set {
            self.name = pname
        }
    }
    
    var pdescr: String? {
        get {
            return self.descr
        }
        set {
            self.descr = pdescr
        }
    }
    
    var ppicture: NSData? {
        get {
            return self.picture
        }
        set {
            self.picture = ppicture
        }
    }
    
    var plocation: Location? {
        get {
            return self.location
        }
        set {
            self.location = plocation
        }
    }
}