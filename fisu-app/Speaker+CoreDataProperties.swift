//
//  Speaker+CoreDataProperties.swift
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

extension Speaker {

    @NSManaged var address: String?
    @NSManaged var descr: String?
    @NSManaged var email: String?
    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var phone: String?
    @NSManaged var picture: NSData?
    @NSManaged var sex: String?
    @NSManaged var title: String?
    @NSManaged var speakerSet: NSManagedObject?

}
