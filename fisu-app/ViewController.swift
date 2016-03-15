//
//  ViewController.swift
//  fisu-app
//
//  Created by pierre-louis faure on 04/02/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

