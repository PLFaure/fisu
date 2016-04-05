//
//  RestoViewController.swift
//  fisu-app
//
//  Created by Faustine Geoffray on 05/04/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit
import MapKit

class RestoViewController: UIViewController, MKMapViewDelegate {
    var theResto: Restaurant?
    var theRestoLoc: Location?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbNameResto.text = theResto!.pname
        lbDescrResto.text = theResto!.pdescr
        
        //for the restaurant location
        theRestoLoc = theResto?.plocation
        let lat = Double(theRestoLoc!.platitude!)
        let lon = Double(theRestoLoc!.plongitude!)
        let restoloc = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
        
        //for the map
        self.restoLocation.delegate = self
        let span = MKCoordinateSpanMake(0.1,0.1)
        let region = MKCoordinateRegion(center: restoloc, span: span)
        self.restoLocation.setRegion(region, animated: true)
        
        //the restaurant pin
        let restoPin = MKPointAnnotation()
        restoPin.coordinate = restoloc
        restoPin.title = theResto!.pname
        restoPin.subtitle = theResto?.pdescr
       self.restoLocation.addAnnotation(restoPin)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       
    
    @IBOutlet weak var lbNameResto: UILabel! //the restaurant's name
    @IBOutlet weak var lbDescrResto: UILabel! //the restautant's description
    @IBOutlet weak var buttonMap: UIButton!
    @IBOutlet weak var restoLocation: MKMapView!
    
    
    
    //name descr picture location

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
