//
//  ViewControllerMap.swift
//  fisu-app
//
//  Created by IG2013 on 17/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit
import MapKit

class ViewControllerMap: UIViewController, MKMapViewDelegate {
    var eventsLoc: [Event]?
    var restaurantsLoc: [Restaurant]?
    var accomodationsLoc: [Accomodation]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        //location of montpellier city
        let location = CLLocationCoordinate2D(latitude: 43.61092, longitude: 3.87723)
        //Pour définir la taille du zoom de départ
        let span = MKCoordinateSpanMake(0.3,0.3)
        let region = MKCoordinateRegion(center: location, span: span)
        self.mapView.setRegion(region, animated: true)
        self.displayEvents()
        self.displayRestos()
        self.displayAccoms()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var mapView: MKMapView!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
    
    /// Displays the events on the map.
    func displayEvents() {
        guard let e = self.eventsLoc where e.count > 0 else {
            return
        }
        let n = e.count
        var annotations = [ColorPointAnnotation]()
        var i = 0
        var lat = 0.0
        var long = 0.0
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE dd MMMM, h:mm a"
        while (i < n) {
            lat = Double(e[i].location!.latitude!)!
            long = Double(e[i].location!.longitude!)!
            annotations.append(ColorPointAnnotation(pinColor: UIColor.blueColor())) //add the i-th element to annotations array
            annotations[i].coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            annotations[i].title = "Event: "+(e[i].name)!
            annotations[i].subtitle = (e[i].descr)!+" "+(dateFormatter.stringFromDate(e[i].date!))
            self.mapView.addAnnotation(annotations[i])
            i++
        }
    }
    
    /// Displays the restaurants on the map.
    func displayRestos() {
        guard let r = self.restaurantsLoc where r.count > 0 else {
            return
        }
        let n = r.count
        var annotations = [ColorPointAnnotation]()
        var i = 0
        var lat = 0.0
        var long = 0.0
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE dd MMMM, h:mm a"
        while (i < n) {
            lat = Double(r[i].location!.latitude!)!
            long = Double(r[i].location!.longitude!)!
            annotations.append(ColorPointAnnotation(pinColor: UIColor.redColor())) //add the i-th element to annotations array
            annotations[i].coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            annotations[i].title = "Restaurant: "+(r[i].name)!
            annotations[i].subtitle = r[i].descr
            self.mapView.addAnnotation(annotations[i])
            i++
        }
    }
    
    /// Displays the accommodation on the map.
    func displayAccoms() {
        guard let a = self.accomodationsLoc where a.count > 0 else {
            return
        }
        let n = a.count
        var annotations = [ColorPointAnnotation]()
        var i = 0
        var lat = 0.0
        var long = 0.0
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE dd MMMM, h:mm a"
        while (i < n) {
            lat = Double(a[i].location!.latitude!)!
            long = Double(a[i].location!.longitude!)!
            annotations.append(ColorPointAnnotation(pinColor: UIColor.greenColor())) //add the i-th element to annotations array
            annotations[i].coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            annotations[i].title = "Accomodation: "+(a[i].name)!
            annotations[i].subtitle = a[i].descr
            self.mapView.addAnnotation(annotations[i])
            i++
        }
    }
    
    
}