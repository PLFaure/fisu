//
//  EventsSet.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData


class EventsSet: NSObject {

    var eventList:[Event?] = []
    
    var peventList: [Event?] {
        get {
            return self.eventList
        }
        set {
            self.eventList = peventList
        }
    }
    
    override init() {
        super.init()
        self.peventList = []
    }
    
    func isPresent(e: Event) -> Bool {
        var present: Bool = false
        var index: Int = 0
        let n: Int = self.peventList.count
        while (!(present) && (index<n)) {
            if (self.isEqual(e)) {
                present = true
            }
            else {
                index++
            }
        }
        return present
    }
    
    func addToList(e: Event) -> Bool {
        self.peventList.append(e)
        return isPresent(e)
    }
    
    func removeFromList(e: Event) -> Bool {
        var b: Bool = false
        var index: Int = 0
        let n: Int = self.peventList.count
        while (!(b) && (index<n)) {
            if (self.isEqual(e)) {
                b = true
            }
            else {
                index++
            }
        }
        if (b) {
            self.peventList.removeAtIndex(index)
            b = !(isPresent(e))
        }
        return b
    }
    
}
