//
//  ViewControllerMap.swift
//  fisu-app
//
//  Created by IG2013 on 17/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit
import MapKit

class ViewControllerMap: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //location of montpellier city
        let location = CLLocationCoordinate2D(latitude: 43.61092, longitude: 3.87723)
        //Pour définir la taille du zoom de départ
        let span = MKCoordinateSpanMake(0.1,0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
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

}