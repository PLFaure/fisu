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
        XCTAssertNotNil(at,"ActivityType not initialised")
        
        //creation of a location and verifcation of its initialisation
        let l : Location = Location.createInManagedObjectContext(moc, name: "Polyetch", latitude: "43.632699", longitude: "3.862738")
        XCTAssertNotNil(l,"Localisation not initialised")
        
        //creation of a speaker and verification of its initialisation
        let s : Speaker = Speaker.createInManagedObjectContext(moc, lastName: "Fiorio", firstName: "Christophe", sex: "Male", title: "Teacher", descr: "very good knowledge in programmation of various languages", email: "private", phone: "private", address: "private", picture: NSData())
        XCTAssertNotNil(s,"Speaker not initialised")
        
        //creation of the SpeakersSet and adding of a speaker
        var sps : [Speaker] = []
        sps.append(s)
        //verification of the SpeakersSet
        XCTAssertEqual(sps, [s], "the collection of Speakers might be [s]")
        
        let e : Event = Event.createInManagedObjectContext(moc, name: "congress of IG students", date: d, descr: "about BI andIOT", type: at, loc: l, speakers: NSSet(array: sps))
        XCTAssertNotNil(e,"Event not initialised")
    }
    
    //test the getters of an Event
    func testGetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let name = "congress of IG students"
        let descr = "about BI andIOT"
        
        //creation of a date
        let d : NSDate = NSDate()
        
        //creation of an activity type and verification of its initialisation
        let at : ActivityType = ActivityType.createInManagedObjectContext(moc, label: "Computer Science")
        XCTAssertNotNil(at,"ActivityType not initialised")
        
        //creation of a location and verifcation of its initialisation
        let l : Location = Location.createInManagedObjectContext(moc, name: "Polyetch", latitude: "43.632699", longitude: "3.862738")
        XCTAssertNotNil(l,"Localisation not initialised")
        
        //creation of a speaker and verification of its initialisation
        let s : Speaker = Speaker.createInManagedObjectContext(moc, lastName: "Fiorio", firstName: "Christophe", sex: "Male", title: "Teacher", descr: "very good knowledge in programmation of various languages", email: "private", phone: "private", address: "private", picture: NSData())
        XCTAssertNotNil(s,"Speaker not initialised")
        
        //creation of the SpeakersSet and adding of a speaker
        var sps : [Speaker] = []
        sps.append(s)
        //verification of the SpeakersSet
        XCTAssertEqual(sps, [s], "the collection of Speakers might be [s]")
        let speakers = NSSet(array: sps)
        
        let e : Event = Event.createInManagedObjectContext(moc, name: name, date: d, descr: descr, type: at, loc: l, speakers: speakers)
        XCTAssertNotNil(e,"Event not initialised")
        
        XCTAssertEqual(e.pname, name, "the names might be the same")
        XCTAssertEqual(e.pdate, d, "the dates might be the same")
        XCTAssertEqual(e.pdescr, descr, "the descriptions might be the same")
        XCTAssertEqual(e.ptype, at, "the types might be the same")
        XCTAssertEqual(e.ploc, l, "the locations might be the same")
        XCTAssertEqual(e.pspeakers, speakers, "the speakers might be the same")
    }
    
    //test the setters of an Event
    func testSetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let name = "congress of IG students"
        let descr = "about BI andIOT"
        
        //creation of a date
        let d : NSDate = NSDate()
        
        //creation of an activity type and verification of its initialisation
        let at : ActivityType = ActivityType.createInManagedObjectContext(moc, label: "Computer Science")
        XCTAssertNotNil(at,"ActivityType not initialised")
        
        //creation of a location and verifcation of its initialisation
        let l : Location = Location.createInManagedObjectContext(moc, name: "Polyetch", latitude: "43.632699", longitude: "3.862738")
        XCTAssertNotNil(l,"Localisation not initialised")
        
        //creation of a speaker and verification of its initialisation
        let s : Speaker = Speaker.createInManagedObjectContext(moc, lastName: "Fiorio", firstName: "Christophe", sex: "Male", title: "Teacher", descr: "very good knowledge in programmation of various languages", email: "private", phone: "private", address: "private", picture: NSData())
        XCTAssertNotNil(s,"Speaker not initialised")
        
        //creation of the SpeakersSet and adding of a speaker
        var sps : [Speaker] = []
        sps.append(s)
        //verification of the SpeakersSet
        XCTAssertEqual(sps, [s], "the collection of Speakers might be [s]")
        let speakers = NSSet(array: sps)
        
        let e : Event = Event.createInManagedObjectContext(moc, name: name, date: d, descr: descr, type: at, loc: l, speakers: speakers)
        XCTAssertNotNil(e,"Event not initialised")
        
        let name2 = "name2"
        XCTAssertNotNil(name2,"name2 not initialised")
        let descr2 = "descr2"
        XCTAssertNotNil(descr2,"descr2 not initialised")
        let date2 = NSDate()
        XCTAssertNotNil(date2,"date2 not initialised")
        let at2 : ActivityType = ActivityType.createInManagedObjectContext(moc, label: "type2")
        XCTAssertNotNil(at2,"type2 not initialised")
        let l2 : Location = Location.createInManagedObjectContext(moc, name: "name", latitude: "lat", longitude: "long")
        XCTAssertNotNil(l2,"l2 not initialised")
        let s2 : Speaker = Speaker.createInManagedObjectContext(moc, lastName: "Morane", firstName: "Bob", sex: "Male", title: "Aventurier", descr: "a la recherche de l'ombre jaune", email: "bob@morane.fr", phone: "06 06 06 06 06", address: "valee infernale", picture: NSData())
        var sps2 : [Speaker] = []
        sps2.append(s2)
        XCTAssertEqual(sps2, [s2], "the collection of Speakers might be [s2]")
        let speakers2 = NSSet(array: sps2)
        
        e.pname = name2
        e.pdate = date2
        e.pdescr = descr2
        e.ptype = at2
        e.ploc = l2
        e.pspeakers = speakers2
        
        XCTAssertEqual(e.pname, name2, "the labels might be the same")
        XCTAssertNotEqual(e.pname, name, "the labels might be differents")
        XCTAssertEqual(e.pdate, date2, "the labels might be the same")
        XCTAssertNotEqual(e.pdate, d, "the labels might be differents")
        XCTAssertEqual(e.pdescr, descr2, "the labels might be the same")
        XCTAssertNotEqual(e.pdescr, descr, "the labels might be differents")
        XCTAssertEqual(e.ptype, at2, "the labels might be the same")
        XCTAssertNotEqual(e.ptype, at, "the labels might be differents")
        XCTAssertEqual(e.ploc, l2, "the labels might be the same")
        XCTAssertNotEqual(e.ploc, l, "the labels might be differents")
        XCTAssertEqual(e.pspeakers, speakers2, "the labels might be the same")
        XCTAssertNotEqual(e.pspeakers, speakers, "the labels might be differents")
    }

}
