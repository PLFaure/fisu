//
//  Speaker.swift
//  fisu-app
//
//  Created by IG2013 on 04/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit

class Speaker: NSObject {
    var firstName : String = ""
    var lastName : String = ""
    var email : String = ""
    var phone : String = ""
    var title : String = ""
    var descr : String = ""
    var sex : String = ""
    var picture : String = ""
    var nationality : String = ""
    
    init(firstName : String, lastName : String, email : String, phone : String, title : String, description : String, sex : String, picture : String, nationality : String) {
        super.init()
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone
        self.title = title
        self.descr = description
        self.sex = sex
        self.picture = picture
        self.nationality = nationality
    }
}
