//
//  Speaker.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData


class Speaker: NSManagedObject {

    var plastName: String? {
        get {
            return self.lastName
        }
        set {
            self.lastName = plastName
        }
    }
    
    var pfirstName: String? {
        get {
            return self.firstName
        }
        set {
            self.firstName = pfirstName
        }
    }
    
    var psex: String? {
        get {
            return self.sex
        }
        set {
            self.sex = psex
        }
    }
    
    var ptitle: String? {
        get {
            return self.title
        }
        set {
            self.title = ptitle
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
    
    var pemail: String? {
        get {
            return self.email
        }
        set {
            self.email = pemail
        }
    }
    
    var pphone: String? {
        get {
            return self.phone
        }
        set {
            self.phone = pphone
        }
    }
    
    var paddress: String? {
        get {
            return self.address
        }
        set {
            self.address = paddress
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
}
