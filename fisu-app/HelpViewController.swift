//
//  HelpViewController.swift
//  fisu-app
//
//  Created by IG2013 on 12/04/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        theFisuLabel.text = "This is the International Federation of University Sports"
        whyLabel.text = "In july 2016, the FISU organizes a big event in Montpellier with a lot of people who come from all around the world. This application was created to facilitate theirs journeys."
        whatLabel.text = "It's a forum. The program includes lectures, workshops, city tours, and sports activities"
        ourApplicationLabel.text = "The visualisation of the event's program, \n" + "the speakers profil (from the program), \n" + "the possibility to define its programm, \n" + "a short list of restaurants (with a description), \n" + "a city map to find all the places easily (restaurants, accomodations, and all events)."
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var theFisuLabel: UILabel!
    @IBOutlet weak var whyLabel: UILabel!
    @IBOutlet weak var whatLabel: UILabel!
    @IBOutlet weak var ourApplicationLabel: UILabel!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
