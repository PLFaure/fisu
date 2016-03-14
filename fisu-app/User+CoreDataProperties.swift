//
//  User+CoreDataProperties.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var email: String?
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var nationality: String?
    @NSManaged var password: String?
    @NSManaged var phone: String?
    @NSManaged var sex: String?
    @NSManaged var userName: String?
    @NSManaged var eventsSet: EventsSet?

}
