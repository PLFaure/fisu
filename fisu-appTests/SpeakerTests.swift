//
//  SpeakerTests.swift
//  fisu-app
//
//  Created by IG2013 on 11/04/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import XCTest

@testable import fisu_app

class SpeakerTests: XCTestCase {
    
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
    
    //test the initialisation of a Speaker
    func testInit(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        let lastName = "nom"
        XCTAssertNotNil(lastName,"lastName not initialised")
        let firstName = "prenom"
        XCTAssertNotNil(firstName,"firstName not initialised")
        let sex = "Male"
        XCTAssertNotNil(sex,"sex not initialised")
        let title = "titre"
        XCTAssertNotNil(title,"title not initialised")
        let descr = "description"
        XCTAssertNotNil(descr,"description not initialised")
        let email = "email"
        XCTAssertNotNil(email,"email not initialised")
        let phone = "phone"
        XCTAssertNotNil(phone,"phone not initialised")
        let address = "address"
        XCTAssertNotNil(address,"address not initialised")
        let picture = NSData()
        XCTAssertNotNil(picture,"picture not initialised")
        
        let sp : Speaker = Speaker.createInManagedObjectContext(moc, lastName: lastName, firstName: firstName, sex: sex, title: title, descr: descr, email: email, phone: phone, address: address, picture: picture)
        XCTAssertNotNil(sp,"Speaker not initialised")
    }
    
    //test the getters of a Speaker
    func testGetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let lastName = "nom"
        XCTAssertNotNil(lastName,"lastName not initialised")
        let firstName = "prenom"
        XCTAssertNotNil(firstName,"firstName not initialised")
        let sex = "Male"
        XCTAssertNotNil(sex,"sex not initialised")
        let title = "titre"
        XCTAssertNotNil(title,"title not initialised")
        let descr = "description"
        XCTAssertNotNil(descr,"description not initialised")
        let email = "email"
        XCTAssertNotNil(email,"email not initialised")
        let phone = "phone"
        XCTAssertNotNil(phone,"phone not initialised")
        let address = "address"
        XCTAssertNotNil(address,"address not initialised")
        let picture = NSData()
        XCTAssertNotNil(picture,"picture not initialised")
        let sp : Speaker = Speaker.createInManagedObjectContext(moc, lastName: lastName, firstName: firstName, sex: sex, title: title, descr: descr, email: email, phone: phone, address: address, picture: picture)
        XCTAssertNotNil(sp,"Speaker not initialised")
        
        XCTAssertEqual(sp.plastName, lastName, "the names might be the same")
        XCTAssertEqual(sp.pfirstName, firstName, "the first names might be the same")
        XCTAssertEqual(sp.psex, sex, "the sexes might be the same")
        XCTAssertEqual(sp.ptitle, title, "the titles might be the same")
        XCTAssertEqual(sp.pdescr, descr, "the descriptions might be the same")
        XCTAssertEqual(sp.pemail, email, "the emails might be the same")
        XCTAssertEqual(sp.pphone, phone, "the phones might be the same")
        XCTAssertEqual(sp.paddress, address, "the addresses might be the same")
        XCTAssertEqual(sp.ppicture, picture, "the pictures might be the same")
    }
    
    //test the setters of a Speaker
    func testSetters(){
        let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let lastName = "nom"
        XCTAssertNotNil(lastName,"lastName not initialised")
        let firstName = "prenom"
        XCTAssertNotNil(firstName,"firstName not initialised")
        let sex = "Male"
        XCTAssertNotNil(sex,"sex not initialised")
        let title = "titre"
        XCTAssertNotNil(title,"title not initialised")
        let descr = "description"
        XCTAssertNotNil(descr,"description not initialised")
        let email = "email"
        XCTAssertNotNil(email,"email not initialised")
        let phone = "phone"
        XCTAssertNotNil(phone,"phone not initialised")
        let address = "address"
        XCTAssertNotNil(address,"address not initialised")
        let str1 = "lol"
        let picture = str1.dataUsingEncoding(NSUTF8StringEncoding)
        XCTAssertNotNil(picture,"picture not initialised")
        let sp : Speaker = Speaker.createInManagedObjectContext(moc, lastName: lastName, firstName: firstName, sex: sex, title: title, descr: descr, email: email, phone: phone, address: address, picture: picture!)
        XCTAssertNotNil(sp,"Speaker not initialised")
        
        let lastName2 = "nom2"
        XCTAssertNotNil(lastName2,"lastName2 not initialised")
        let firstName2 = "prenom2"
        XCTAssertNotNil(firstName2,"firstName2 not initialised")
        let sex2 = "Female"
        XCTAssertNotNil(sex2,"sex2 not initialised")
        let title2 = "titre2"
        XCTAssertNotNil(title2,"title2 not initialised")
        let descr2 = "description2"
        XCTAssertNotNil(descr2,"description2 not initialised")
        let email2 = "email2"
        XCTAssertNotNil(email2,"email2 not initialised")
        let phone2 = "phone2"
        XCTAssertNotNil(phone2,"phone2 not initialised")
        let address2 = "address2"
        XCTAssertNotNil(address2,"address2 not initialised")
        let str2 = "mdr"
        let picture2 = str2.dataUsingEncoding(NSUTF8StringEncoding)
        XCTAssertNotNil(picture2,"picture2 not initialised")
        
        sp.plastName = lastName2
        sp.pfirstName = firstName2
        sp.psex = sex2
        sp.ptitle = title2
        sp.pdescr = descr2
        sp.pemail = email2
        sp.pphone = phone2
        sp.paddress = address2
        sp.ppicture = picture2
        
        XCTAssertEqual(sp.plastName, lastName2, "the names might be the same")
        XCTAssertNotEqual(sp.plastName, lastName, "the names might be differents")
        XCTAssertEqual(sp.pfirstName, firstName2, "the first names might be the same")
        XCTAssertNotEqual(sp.pfirstName, firstName, "the first names might be differents")
        XCTAssertEqual(sp.psex, sex2, "the sexes might be the same")
        XCTAssertNotEqual(sp.psex, sex, "the sexes might be differents")
        XCTAssertEqual(sp.ptitle, title2, "the titles might be the same")
        XCTAssertNotEqual(sp.ptitle, title, "the titles might be differents")
        XCTAssertEqual(sp.pdescr, descr2, "the descriptions might be the same")
        XCTAssertNotEqual(sp.pdescr, descr, "the descriptions might be differents")
        XCTAssertEqual(sp.pemail, email2, "the emails might be the same")
        XCTAssertNotEqual(sp.pemail, email, "the emails might be differents")
        XCTAssertEqual(sp.pphone, phone2, "the phones might be the same")
        XCTAssertNotEqual(sp.pphone, phone, "the phones might be differents")
        XCTAssertEqual(sp.paddress, address2, "the addresses might be the same")
        XCTAssertNotEqual(sp.paddress, address, "the addresses might be differents")
        XCTAssertEqual(sp.ppicture, picture2, "the pictures might be the same")
        XCTAssertNotEqual(sp.ppicture, picture, "the pictures might be differents")
    }
}
