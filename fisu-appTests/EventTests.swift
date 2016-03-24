//
//  EventTests.swift
//  fisu-app
//
//  Created by IG2013 on 24/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import XCTest

@testable import fisu_app

class EventTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    //test the initialisation of an Event
    func testInit(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        //creation of a date
        let d : NSDate = NSDate()
        
        //creation of an activity type and verification of its initialisation
        let at : ActivityType = ActivityType.createInManagedObjectContext(moc, label: "Computer Science")
        XCTAssertNotNil(at,"ActivityType don't initialised")
        
        //creation of a location and verifcation of its initialisation
        let l : Location = Location.createInManagedObjectContext(moc, name: "Polyetch", latitude: "43.632699", longitude: "3.862738")
        XCTAssertNotNil(l,"Localisation don't initialised")
        
        //creation of a speaker and verification of its initialisation
        let s : Speaker = Speaker.createInManagedObjectContext(moc, lastName: "Fiorio", firstName: "Christophe", sex: "Male", title: "Teacher", descr: "very good knowledge in programmation of various languages", email: "private", phone: "private", address: "private", picture: NSData())
        XCTAssertNotNil(s,"Speaker don't initialised")
        
        //creation of the SpeakersSet and adding of a speaker
        var sps : [Speaker] = []
        sps.append(s)
        //verification of the SpeakersSet
        XCTAssertEqual(sps, [s], "the collection of Speakers might be [s]")
        
        let e : Event = Event.createInManagedObjectContext(moc, name: "congress of IG students", date: d, descr: "about BI andIOT", type: at, loc: l, speakers: NSSet(array: sps))
        XCTAssertNotNil(e,"Event don't initialised")

       
    }
}
