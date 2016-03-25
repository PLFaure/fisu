//
//  ProfilViewController.swift
//  fisu-app
//
//  Created by IG2013 on 25/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit

class ProfilViewController: UIViewController {
    var profil: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelUserName.text = profil!.puserName
        labelUserEmail.text = profil!.pemail
        labelUserLastName.text = profil!.plastName
        labelUserFirstName.text = profil!.pfirstName
        labelUserSex.text = profil!.psex
        labeluSerNationality.text = profil!.pnationality
        labelUserPhone.text = profil!.pphone
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelUserEmail: UILabel!
    @IBOutlet weak var labelUserLastName: UILabel!
    @IBOutlet weak var labelUserFirstName: UILabel!
    @IBOutlet weak var labelUserSex: UILabel!
    @IBOutlet weak var labeluSerNationality: UILabel!
    @IBOutlet weak var labelUserPhone: UILabel!
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
