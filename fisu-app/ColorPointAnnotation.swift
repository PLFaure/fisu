//
//  ColorPointAnnotation.swift
//  fisu-app
//
//  Created by IG2013 on 04/04/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit
import MapKit

/// Class for the color of the pin.
class ColorPointAnnotation: MKPointAnnotation {
    var pinColor: UIColor
    
    init(pinColor: UIColor) {
        self.pinColor = pinColor
        super.init()
    }
}
