//
//  SpeakersSet+CoreDataProperties.swift
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

extension SpeakersSet {

    @NSManaged var event: Event?
    @NSManaged var speaker: Speaker?

}
