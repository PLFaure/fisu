//
//  SpeakerViewController.swift
//  fisu-app
//
//  Created by IG2013 on 25/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit

class SpeakerViewController: UIViewController {
    var theEvent:Event?
    var theEventDateConverter:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventName.text = theEvent?.name
        eventDate.text = theEventDateConverter
        eventDescription.text = theEvent?.descr
        activityType.text = theEvent?.activityType?.label

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: properties
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var activityType: UILabel!
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
