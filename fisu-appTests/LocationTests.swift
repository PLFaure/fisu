//
//  LocationTests.swift
//  fisu-app
//
//  Created by IG2013 on 11/04/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import XCTest

@testable import fisu_app

class LocationTests: XCTestCase {
    
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
    
    //test the initialisation of a Location
    func testInit(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let name = "name"
        XCTAssertNotNil(name,"name not initialised")
        let latitude = "latitude"
        XCTAssertNotNil(latitude,"latitude not initialised")
        let longitude = "longitude"
        XCTAssertNotNil(longitude,"longitude not initialised")
        
        let loc : Location = Location.createInManagedObjectContext(moc, name: name, latitude: latitude, longitude: longitude)
        XCTAssertNotNil(loc,"Location not initialised")
    }
    
    //test the getters of a Location
    func testGetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let name = "name"
        XCTAssertNotNil(name,"name not initialised")
        let latitude = "latitude"
        XCTAssertNotNil(latitude,"latitude not initialised")
        let longitude = "longitude"
        XCTAssertNotNil(longitude,"longitude not initialised")
        let loc : Location = Location.createInManagedObjectContext(moc, name: name, latitude: latitude, longitude: longitude)
        XCTAssertNotNil(loc,"Location not initialised")
        
        XCTAssertEqual(loc.pname, name, "the names might be the same")
        XCTAssertEqual(loc.platitude, latitude, "the latitudes might be the same")
        XCTAssertEqual(loc.plongitude, longitude, "the longitudes might be the same")
    }
    
    //test the setters of a Location
    func testSetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let name = "name"
        XCTAssertNotNil(name,"name not initialised")
        let latitude = "latitude"
        XCTAssertNotNil(latitude,"latitude not initialised")
        let longitude = "longitude"
        XCTAssertNotNil(longitude,"longitude not initialised")
        let loc : Location = Location.createInManagedObjectContext(moc, name: name, latitude: latitude, longitude: longitude)
        XCTAssertNotNil(loc,"Location not initialised")

        let name2 = "name2"
        XCTAssertNotNil(name2,"name2 not initialised")
        let latitude2 = "latitude2"
        XCTAssertNotNil(latitude2,"latitude2 not initialised")
        let longitude2 = "longitude2"
        XCTAssertNotNil(longitude2,"longitude2 not initialised")
        
        loc.pname = name2
        loc.platitude = latitude2
        loc.plongitude = longitude2
        XCTAssertEqual(loc.pname, name2, "the names might be the same")
        XCTAssertNotEqual(loc.pname, name, "the names might be differents")
        XCTAssertEqual(loc.platitude, latitude2, "the latitudes might be the same")
        XCTAssertNotEqual(loc.platitude, latitude, "the latitudes might be differents")
        XCTAssertEqual(loc.plongitude, longitude2, "the longitudes might be the same")
        XCTAssertNotEqual(loc.plongitude, longitude, "the longitudes might be differents")
    }

    
}
