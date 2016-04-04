//
//  SpeakerDescrViewController.swift
//  fisu-app
//
//  Created by IG2013 on 04/04/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit

class SpeakerDescrViewController: UIViewController {
    var theSpeaker:Speaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbLastName.text = theSpeaker!.plastName
        lbFirstName.text = theSpeaker!.pfirstName
        lbTitle.text = theSpeaker!.ptitle
        lbMail.text = theSpeaker!.pemail
        lbPhone.text = theSpeaker!.pphone
        lbDescr.text = theSpeaker!.pdescr
        lbAddress.text = theSpeaker!.paddress
        let pictureNSData = theSpeaker!.ppicture
        picture.image = UIImage(data: pictureNSData!)
        
        //picture.image = theSpeaker!.ppicture
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var lbLastName: UILabel!
    @IBOutlet weak var lbFirstName: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbMail: UILabel!
    @IBOutlet weak var lbPhone: UILabel!
    @IBOutlet weak var lbDescr: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    
    

    
    
    
}
