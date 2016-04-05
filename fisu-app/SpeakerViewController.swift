//
//  SpeakerViewController.swift
//  fisu-app
//
//  Created by IG2013 on 25/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit
import MapKit


class SpeakerViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {
    var theEvent:Event?
    var theEventDateConverter:String?
    var speakersArray: [Speaker] = []
    var theEventLoc: Location?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventName.text = theEvent?.name
        eventDate.text = theEventDateConverter
        eventDescription.text = theEvent?.descr
        activityType.text = theEvent?.activityType?.label
        mySpeakersTable.dataSource = self
        mySpeakersTable.delegate=self
        
        //for the event location
        theEventLoc = theEvent?.ploc
        let lat = Double(theEventLoc!.platitude!)
        let lon = Double(theEventLoc!.plongitude!)
        let eventloc = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
        
        //for the map
        self.eventLocation.delegate = self
        let span = MKCoordinateSpanMake(0.1,0.1)
        let region = MKCoordinateRegion(center: eventloc, span: span)
        self.eventLocation.setRegion(region, animated: true)
        
        //the restaurant pin
        let eventPin = MKPointAnnotation()
        eventPin.coordinate = eventloc
        eventPin.title = theEvent!.pname
        eventPin.subtitle = theEvent?.pdescr
        self.eventLocation.addAnnotation(eventPin)
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: properties
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var activityType: UILabel!
    @IBOutlet weak var mySpeakersTable: UITableView!
    @IBOutlet weak var eventLocation: MKMapView!
    
    
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
