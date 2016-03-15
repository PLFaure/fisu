//
//  SpeakersSet.swift
//  fisu-app
//
//  Created by IG2013 on 14/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import Foundation
import CoreData


class SpeakersSet: NSObject {

    var speakerList:[Speaker?] = []
    
    var pspeakerList: [Speaker?] {
        get {
            return self.speakerList
        }
        set {
            self.speakerList = pspeakerList
        }
    }
    
    override init() {
        super.init()
        self.pspeakerList = []
    }
    
    func isPresent(s: Speaker) -> Bool {
        var present: Bool = false
        var index: Int = 0
        let n: Int = self.pspeakerList.count
        while (!(present) && (index<n)) {
            if (self.isEqual(s)) {
                present = true
            }
            else {
                index++
            }
        }
        return present
    }
    
    func addToList(s: Speaker) -> Bool {
        self.pspeakerList.append(s)
        return isPresent(s)
    }
    
    func removeFromList(s: Speaker) -> Bool {
        var b: Bool = false
        var index: Int = 0
        let n: Int = self.pspeakerList.count
        while (!(b) && (index<n)) {
            if (self.isEqual(s)) {
                b = true
            }
            else {
                index++
            }
        }
        if (b) {
            self.pspeakerList.removeAtIndex(index)
            b = !(isPresent(s))
        }
        return b
    }
}
