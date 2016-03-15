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

    var programme: EventsSet = EventsSet()
    
    var puserName: String? {
        get {
            return self.userName
        }
        set {
            self.userName = puserName
        }
    }
    
    var ppassword: String? {
        get {
            return self.password
        }
        set {
            self.password = ppassword
        }
    }
    
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
    
    var pnationality: String? {
        get {
            return self.nationality
        }
        set {
            self.nationality = pnationality
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
}