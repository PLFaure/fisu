//
//  SpeakerViewController.swift
//  fisu-app
//
//  Created by IG2013 on 25/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit
import MapKit


class EventViewController: UIViewController, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource {
    var theEvent:Event?
    var theEventDateConverter:String?
    var speakersArray: [Speaker] = []
    var theEventLoc: Location?
    var theUser: User?
    
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
        let eventPin = ColorPointAnnotation(pinColor: UIColor.blueColor())
        eventPin.coordinate = eventloc
        eventPin.title = theEvent!.pname
        eventPin.subtitle = theEvent?.pdescr
        self.eventLocation.addAnnotation(eventPin)
        
        
        if isPresentUserEv() {
            self.addRemSwitch.setOn(true, animated:true)
        } else {
            self.addRemSwitch.setOn(false, animated:true)
        }
        // Do any additional setup after loading the view.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            
            let colorPointAnnotation = annotation as! ColorPointAnnotation
            pinView?.pinTintColor = colorPointAnnotation.pinColor
        }
        else {
            pinView?.annotation = annotation
        }
        pinView?.animatesDrop = true
        pinView?.canShowCallout = true
        return pinView
    }
    
    // MARK: properties
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var activityType: UILabel!
    @IBOutlet weak var mySpeakersTable: UITableView!
    @IBOutlet weak var eventLocation: MKMapView!
    @IBOutlet weak var addRemSwitch: UISwitch!
    
    @IBAction func addAction(sender: AnyObject) {
        var userEvents = self.theUser?.pevents!.allObjects as? [Event]
        if addRemSwitch.on {
            if !self.isPresentUserEv() {
                userEvents?.append(self.theEvent!)
                print("peut etre que ca marche")
            }
        } else {
            if self.isPresentUserEv() {
                userEvents=removeEvent(userEvents!)
            }
        }
        self.theUser?.pevents = NSSet(array: userEvents!)
    }
    
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
    
    func isPresentUserEv() -> Bool {
        var evArray = self.theUser?.pevents!.allObjects as? [Event]
        var i = 0
        let n = evArray?.count
        var present = false
        while (i<n) && !present {
            if (evArray![i] == theEvent) {
                present = true
            } else {
                i++
            }
        }
        return present
    }

    func removeEvent(events: [Event]) -> [Event]{
        var evts = events
        var i = 0
        let n = evts.count
        var present = false
        while (i<n) && !present {
            if (evts[i] == self.theEvent) {
                present = true
            }
            else {
                i++
            }
        }
        evts.removeAtIndex(i)
        return evts
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Back button pressed
   override func didMoveToParentViewController(parent: UIViewController?) {
        if (!(parent?.isEqual(self.parentViewController) ?? false)) {
            self.performSegueWithIdentifier("unwindToTVCE", sender: self)
            print("ca marche pas?")
        } 
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
