//
//  Restaurant.swift
//  fisu-app
//
//  Created by IG2013 on 11/04/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import XCTest

@testable import fisu_app

class RestaurantTests: XCTestCase {
    
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
    
    //test the initialisation of a Restaurant
    func testInit(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let name = "nom"
        XCTAssertNotNil(name,"name not initialised")
        let descr = "description"
        XCTAssertNotNil(descr,"description not initialised")
        let picture = NSData()
        XCTAssertNotNil(picture,"picture not initialised")
        let l : Location = Location.createInManagedObjectContext(moc, name: "Polyetch", latitude: "43.632699", longitude: "3.862738")
        XCTAssertNotNil(l,"localisation not initialised")

        let rest : Restaurant = Restaurant.createInManagedObjectContext(moc, name: name, descr: descr, picture: picture, loc: l)
        XCTAssertNotNil(rest,"Restaurant not initialised")
    }
    
    //test the getters of a Restaurant
    func testGetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let name = "nom"
        XCTAssertNotNil(name,"name not initialised")
        let descr = "description"
        XCTAssertNotNil(descr,"description not initialised")
        let picture = NSData()
        XCTAssertNotNil(picture,"picture not initialised")
        let l : Location = Location.createInManagedObjectContext(moc, name: "Polyetch", latitude: "43.632699", longitude: "3.862738")
        XCTAssertNotNil(l,"localisation not initialised")
        let rest : Restaurant = Restaurant.createInManagedObjectContext(moc, name: name, descr: descr, picture: picture, loc: l)
        XCTAssertNotNil(rest,"Restaurant not initialised")
        
        XCTAssertEqual(rest.pname, name, "the names might be the same")
        XCTAssertEqual(rest.pdescr, descr, "the descriptions might be the same")
        XCTAssertEqual(rest.ppicture, picture, "the pictures might be the same")
        XCTAssertEqual(rest.plocation, l, "the locations might be the same")
    }
    
    //test the setters of a Restaurant
    func testSetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let name = "nom"
        XCTAssertNotNil(name,"name not initialised")
        let descr = "description"
        XCTAssertNotNil(descr,"description not initialised")
        let str1 = "lol"
        let picture = str1.dataUsingEncoding(NSUTF8StringEncoding)
        XCTAssertNotNil(picture,"picture not initialised")
        let l : Location = Location.createInManagedObjectContext(moc, name: "Polyetch", latitude: "43.632699", longitude: "3.862738")
        XCTAssertNotNil(l,"localisation not initialised")
        let rest : Restaurant = Restaurant.createInManagedObjectContext(moc, name: name, descr: descr, picture: picture!, loc: l)
        XCTAssertNotNil(rest,"Restaurant not initialised")
        
        let name2 = "nom2"
        XCTAssertNotNil(name2,"name2 not initialised")
        let descr2 = "description2"
        XCTAssertNotNil(descr2,"description2 not initialised")
        let str2 = "mdr"
        let picture2 = str2.dataUsingEncoding(NSUTF8StringEncoding)
        XCTAssertNotNil(picture2,"picture2 not initialised")
        XCTAssertNotEqual(picture, picture2, "the picture might be differents")
        let l2 : Location = Location.createInManagedObjectContext(moc, name: "trezgtr", latitude: "44.632899", longitude: "2.8627415")
        XCTAssertNotNil(l2,"localisation2 not initialised")
        
        rest.pname = name2
        rest.pdescr = descr2
        rest.ppicture = picture2
        rest.plocation = l2
        XCTAssertEqual(rest.pname, name2, "the names might be the same")
        XCTAssertNotEqual(rest.pname, name, "the names might be differents")
        XCTAssertEqual(rest.pdescr, descr2, "the descriptions might be the same")
        XCTAssertNotEqual(rest.pdescr, descr, "the descriptions might be differents")
        XCTAssertEqual(rest.ppicture, picture2, "the pictures might be the same")
        XCTAssertNotEqual(rest.ppicture, picture, "the pictures might be differents")
        XCTAssertEqual(rest.plocation, l2, "the locations might be the same")
        XCTAssertNotEqual(rest.plocation, l, "the locations might be differents")
    }

    
}
