//
//  ActivityType.swift
//  fisu-app
//
//  Created by IG2013 on 04/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit

class ActivityType: NSObject {
    var atlabel: String = ""
    
    init(label: String) {
        super.init()
        self.label = label
    }
    
    var label: String {
        set {
            self.atlabel = label
        }
        get {
            return self.atlabel
        }
    }

}