//
//  UserTests.swift
//  fisu-app
//
//  Created by IG2013 on 11/04/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import XCTest

@testable import fisu_app

class UserTests: XCTestCase {
    
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
    
    //test the initialisation of a User
    func testInit(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let userName = "userName"
        XCTAssertNotNil(userName,"userName not initialised")
        let password = "password"
        XCTAssertNotNil(password,"password not initialised")
        let lastName = "lastName"
        XCTAssertNotNil(lastName,"lastName not initialised")
        let firstName = "firstName"
        XCTAssertNotNil(firstName,"firstName not initialised")
        let sex = "sex"
        XCTAssertNotNil(sex,"sex not initialised")
        let email = "email"
        XCTAssertNotNil(email,"email not initialised")
        let phone = "phone"
        XCTAssertNotNil(phone,"phone not initialised")
        let nationality = "nationality"
        XCTAssertNotNil(nationality,"nationality not initialised")
        let events = NSSet()
        XCTAssertNotNil(events,"events not initialised")
        
        let usr : User = User.createInManagedObjectContext(moc, userName: userName, password: password, lastName: lastName, firstName: firstName, sex: sex, email: email, phone: phone, nationality: nationality, events: events)
        XCTAssertNotNil(usr,"User not initialised")
    }
    
    //test the getters of a User
    func testGetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let userName = "userName"
        XCTAssertNotNil(userName,"userName not initialised")
        let password = "password"
        XCTAssertNotNil(password,"password not initialised")
        let lastName = "lastName"
        XCTAssertNotNil(lastName,"lastName not initialised")
        let firstName = "firstName"
        XCTAssertNotNil(firstName,"firstName not initialised")
        let sex = "sex"
        XCTAssertNotNil(sex,"sex not initialised")
        let email = "email"
        XCTAssertNotNil(email,"email not initialised")
        let phone = "phone"
        XCTAssertNotNil(phone,"phone not initialised")
        let nationality = "nationality"
        XCTAssertNotNil(nationality,"nationality not initialised")
        let events = NSSet()
        XCTAssertNotNil(events,"events not initialised")
        let usr : User = User.createInManagedObjectContext(moc, userName: userName, password: password, lastName: lastName, firstName: firstName, sex: sex, email: email, phone: phone, nationality: nationality, events: events)
        XCTAssertNotNil(usr,"User not initialised")
        
        XCTAssertEqual(usr.puserName, userName, "the userNames might be the same")
        XCTAssertEqual(usr.ppassword, password, "the passwords might be the same")
        XCTAssertEqual(usr.plastName, lastName, "the lastNames might be the same")
        XCTAssertEqual(usr.pfirstName, firstName, "the firstNames might be the same")
        XCTAssertEqual(usr.psex, sex, "the sexes might be the same")
        XCTAssertEqual(usr.pemail, email, "the emails might be the same")
        XCTAssertEqual(usr.pphone, phone, "the phones might be the same")
        XCTAssertEqual(usr.pnationality, nationality, "the nationalities might be the same")
        XCTAssertEqual(usr.pevents, events, "the events might be the same")
    }
    
    //test the setters of an ActivityType
    func testSetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let userName = "userName"
        XCTAssertNotNil(userName,"userName not initialised")
        let password = "password"
        XCTAssertNotNil(password,"password not initialised")
        let lastName = "lastName"
        XCTAssertNotNil(lastName,"lastName not initialised")
        let firstName = "firstName"
        XCTAssertNotNil(firstName,"firstName not initialised")
        let sex = "sex"
        XCTAssertNotNil(sex,"sex not initialised")
        let email = "email"
        XCTAssertNotNil(email,"email not initialised")
        let phone = "phone"
        XCTAssertNotNil(phone,"phone not initialised")
        let nationality = "nationality"
        XCTAssertNotNil(nationality,"nationality not initialised")
        let events = NSSet()
        XCTAssertNotNil(events,"events not initialised")
        let usr : User = User.createInManagedObjectContext(moc, userName: userName, password: password, lastName: lastName, firstName: firstName, sex: sex, email: email, phone: phone, nationality: nationality, events: events)
        XCTAssertNotNil(usr,"User not initialised")
        
        let userName2 = "userName2"
        XCTAssertNotNil(userName2,"userName2 not initialised")
        let password2 = "password2"
        XCTAssertNotNil(password2,"password2 not initialised")
        let lastName2 = "lastName2"
        XCTAssertNotNil(lastName2,"lastName2 not initialised")
        let firstName2 = "firstName2"
        XCTAssertNotNil(firstName2,"firstName2 not initialised")
        let sex2 = "sex2"
        XCTAssertNotNil(sex2,"sex2 not initialised")
        let email2 = "email2"
        XCTAssertNotNil(email2,"email2 not initialised")
        let phone2 = "phone2"
        XCTAssertNotNil(phone2,"phone2 not initialised")
        let nationality2 = "nationality2"
        XCTAssertNotNil(nationality2,"nationality2 not initialised")
        var evts: [Event] = []
        let at : ActivityType = ActivityType.createInManagedObjectContext(moc, label: "label")
        let l : Location = Location.createInManagedObjectContext(moc, name: "name", latitude: "latitude", longitude: "longitude")
        let e : Event = Event.createInManagedObjectContext(moc, name: "name", date: NSDate(), descr: "descr", type: at, loc: l, speakers: NSSet())
        XCTAssertNotNil(e,"Event not initialised")
        evts.append(e)
        let events2 = NSSet(array: evts)
        XCTAssertNotNil(events2,"events2 not initialised")
        
        usr.puserName = userName2
        usr.ppassword = password2
        usr.plastName = lastName2
        usr.pfirstName = firstName2
        usr.psex = sex2
        usr.pemail = email2
        usr.pphone = phone2
        usr.pnationality = nationality2
        usr.pevents = events2
        
        XCTAssertEqual(usr.puserName, userName2, "the userNames might be the same")
        XCTAssertNotEqual(usr.puserName, userName, "the userNames might be differents")
        XCTAssertEqual(usr.ppassword, password2, "the passwords might be the same")
        XCTAssertNotEqual(usr.ppassword, password, "the passwords might be differents")
        XCTAssertEqual(usr.plastName, lastName2, "the lastNames might be the same")
        XCTAssertNotEqual(usr.plastName, lastName, "the lastNames might be differents")
        XCTAssertEqual(usr.pfirstName, firstName2, "the firstNames might be the same")
        XCTAssertNotEqual(usr.pfirstName, firstName, "the firstNames might be differents")
        XCTAssertEqual(usr.psex, sex2, "the sexes might be the same")
        XCTAssertNotEqual(usr.psex, sex, "the sexes might be differents")
        XCTAssertEqual(usr.pemail, email2, "the emails might be the same")
        XCTAssertNotEqual(usr.pemail, email, "the emails might be differents")
        XCTAssertEqual(usr.pphone, phone2, "the phones might be the same")
        XCTAssertNotEqual(usr.pphone, phone, "the phones might be differents")
        XCTAssertEqual(usr.pnationality, nationality2, "the nationalities might be the same")
        XCTAssertNotEqual(usr.pnationality, nationality, "the nationalities might be differents")
        XCTAssertEqual(usr.pevents, events2, "the events might be the same")
        XCTAssertNotEqual(usr.pevents, events, "the events might be differents")
    }

    
}
