//
//  SpeakerViewController.swift
//  fisu-app
//
//  Created by IG2013 on 25/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit

class SpeakerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var theEvent:Event?
    var theEventDateConverter:String?
    var speakersArray: [Speaker] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventName.text = theEvent?.name
        eventDate.text = theEventDateConverter
        eventDescription.text = theEvent?.descr
        activityType.text = theEvent?.activityType?.label
        mySpeakersTable.dataSource = self
        mySpeakersTable.delegate=self
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: properties
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var activityType: UILabel!
    @IBOutlet weak var mySpeakersTable: UITableView!
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (theEvent?.pspeakers?.count)!
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //on récupère les speakers (de type NSSet) de l'évènement
        let setSpeakers = self.theEvent?.pspeakers
        //on créer un tableau de speaker vide
        //on insère dans ce tableau les speakers
        for object in setSpeakers! {
            speakersArray.append(object as! Speaker)
        }
        let speaker = speakersArray[indexPath.row]
        //on configure la cellule speakerCell
        let cellIdentifier = "speakerCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SpeakerViewCell
        cell.nameSpeaker.text = speaker.plastName
        return cell
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
      
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "speakerDescription" {
                if let nextScene = segue.destinationViewController as? SpeakerDescrViewController{
                    let indexpath = self.mySpeakersTable.indexPathForSelectedRow
                    nextScene.theSpeaker = self.speakersArray[indexpath!.row]
                }
            }
        }
}
