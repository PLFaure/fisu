//
//  RestoViewController.swift
//  fisu-app
//
//  Created by Faustine Geoffray on 05/04/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit

class RestoViewController: UIViewController {
    var theResto: Restaurant?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbNameResto.text = theResto!.pname
        lbDescrResto.text = theResto!.pdescr
        let pictureNSData = theResto!.ppicture
        menuView.image = UIImage(data: pictureNSData!)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var lbNameResto: UILabel! //the restaurant's name
    @IBOutlet weak var lbDescrResto: UILabel! //the restautant's description
    @IBOutlet weak var buttonMap: UIButton! //the restaurant's location
    @IBOutlet weak var menuView: UIImageView! //the restaurant's picture
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueGPSresto" {
            if let nextScene = segue.destinationViewController as? GPSRestoViewController{
                nextScene.theResto = self.theResto
                nextScene.theRestoLoc = self.theResto?.plocation
            }
        }
    }
    

}
