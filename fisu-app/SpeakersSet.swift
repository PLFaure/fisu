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
 
    /// the speakerList property
    /// - set: for set the speakerList
    /// - get: for get the speakerList
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
    
    /// for determine if a Speaker is present in a SpeakersSet.
    /// - parameter s: an object of type Speaker.
    /// - precondition: none
    /// - returns: a boolean, True if the Speaker is in the SpeakersSet, else False.
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
    
    /// for add a Speaker in a SpeakersSet.
    /// - parameter s: an object of type Speaker
    /// - precondition: none
    /// - returns: a boolean, True if the Speaker has been add in the SpeakersSet, else False.
    func addToList(s: Speaker) -> Bool {
        self.pspeakerList.append(s)
        return isPresent(s)
    }
    
    /// for remove a Speaker in a SpeakersSet
    /// - parameter s: an object of type Speaker
    /// - precondition: none
    /// - returns: a boolean, True if the Speaker has been removed, else False.
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
