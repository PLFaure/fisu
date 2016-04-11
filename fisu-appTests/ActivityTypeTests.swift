//
//  ActivityTypeTests.swift
//  fisu-app
//
//  Created by IG2013 on 11/04/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import XCTest

@testable import fisu_app

class ActivityTypeTests: XCTestCase {
    
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
    
    //test the initialisation of an ActivityType
    func testInit(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let label = "label"
        XCTAssertNotNil(label,"label not initialised")
        
        let at : ActivityType = ActivityType.createInManagedObjectContext(moc, label: label)
        XCTAssertNotNil(at,"ActivityType not initialised")
    }
    
    //test the getters of an ActivityType
    func testGetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let label = "label"
        XCTAssertNotNil(label,"label not initialised")
        let at : ActivityType = ActivityType.createInManagedObjectContext(moc, label: label)
        XCTAssertNotNil(at,"ActivityType not initialised")
        
        XCTAssertEqual(at.plabel, label, "the labels might be the same")
    }
    
    //test the setters of an ActivityType
    func testSetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let label = "label"
        XCTAssertNotNil(label,"label not initialised")
        let at : ActivityType = ActivityType.createInManagedObjectContext(moc, label: label)
        XCTAssertNotNil(at,"ActivityType not initialised")
        
        let label2 = "label2"
        XCTAssertNotNil(label2,"label2 not initialised")
        
        at.plabel = label2
        XCTAssertEqual(at.plabel, label2, "the labels might be the same")
        XCTAssertNotEqual(at.plabel, label, "the labels might be differents")
    }

    
}
