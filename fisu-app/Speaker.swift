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

    class func createInManagedObjectContext(moc: NSManagedObjectContext, lastName: String, firstName: String, sex: String, title: String, descr: String, email: String, phone:String, address: String, picture: NSData) -> Speaker {
        let newSpeaker = NSEntityDescription.insertNewObjectForEntityForName("Speaker", inManagedObjectContext: moc) as! Speaker
        newSpeaker.lastName = lastName
        newSpeaker.firstName = firstName
        newSpeaker.sex = sex
        newSpeaker.title = title
        newSpeaker.descr = descr
        newSpeaker.email = email
        newSpeaker.phone = phone
        newSpeaker.address = address
        newSpeaker.picture = picture
        //////////////////////////////////////////
        return newSpeaker
    }
    
    /// the lastName property
    /// - set: for set the lastName
    /// - get: for get the lastName
    var plastName: String? {
        get {
            return self.lastName
        }
        set {
            self.lastName = newValue
        }
    }
    
    /// the firstName property
    /// - set: for set the firstName
    /// - get: for get the firstName
    var pfirstName: String? {
        get {
            return self.firstName
        }
        set {
            self.firstName = newValue
        }
    }
    
    /// the sex property
    /// - set: for set the sex
    /// - get: for get the sex
    var psex: String? {
        get {
            return self.sex
        }
        set {
            self.sex = newValue
        }
    }
    
    /// the title property
    /// - set: for set the title
    /// - get: for get the title
    var ptitle: String? {
        get {
            return self.title
        }
        set {
            self.title = newValue
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
    
    /// the email property
    /// - set: for set the email
    /// - get: for get the email
    var pemail: String? {
        get {
            return self.email
        }
        set {
            self.email = newValue
        }
    }
    
    /// the phone property
    /// - set: for set the phone
    /// - get: for get the phone
    var pphone: String? {
        get {
            return self.phone
        }
        set {
            self.phone = newValue
        }
    }
    
    /// the address property
    /// - set: for set the address
    /// - get: for get the address
    var paddress: String? {
        get {
            return self.address
        }
        set {
            self.address = newValue
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
}
