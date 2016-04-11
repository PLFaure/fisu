//
//  User.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData


class User: NSManagedObject {
   
    class func createInManagedObjectContext(moc: NSManagedObjectContext, userName: String, password:String, lastName: String, firstName: String, sex: String, email: String, phone: String, nationality: String, events: NSSet) -> User {
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: moc) as! User
        newUser.userName = userName
        newUser.password = password
        newUser.lastName = lastName
        newUser.firstName = firstName
        newUser.sex = sex
        newUser.email = email
        newUser.phone = phone
        newUser.nationality = nationality
        newUser.pevents = events
        return newUser
    }

    /// the name property
    /// - set: for set the name
    /// - get: for get the name
    var puserName: String? {
        get {
            return self.userName
        }
        set {
            self.userName = newValue
        }
    }
    
    /// the password property
    /// - set: for set the password
    /// - get: for get the password
    var ppassword: String? {
        get {
            return self.password
        }
        set {
            self.password = newValue
        }
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
    
    /// the nationality property
    /// - set: for set the nationality
    /// - get: for get the nationality
    var pnationality: String? {
        get {
            return self.nationality
        }
        set {
            self.nationality = newValue
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
    
    /// the EventsSet property
    /// - set: for set the EventsSet
    /// - get: for get the EventsSet
    var pevents: NSSet? {
        get {
            return self.event
        }
        set {
            self.event = newValue
        }
    }
}