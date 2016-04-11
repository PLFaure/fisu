//
//  EventsTableViewCell.swift
//  fisu-app
//
//  Created by IG2013 on 24/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var userEvents: [Event]?
    var theEvent: Event?
    @IBOutlet weak var addRemSwitch: UISwitch!
    @IBAction func buttonClicked(sender: AnyObject) {
        if addRemSwitch.on {
            if !self.isPresentUserEv() {
                self.userEvents?.append(self.theEvent!)
                print("peut etre que ca marche")
            }
        } else {
            if self.isPresentUserEv() {
                self.removeEvent()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func isPresentUserEv() -> Bool {
        var i = 0
        let n = self.userEvents?.count
        var present = false
        while (i<n) && !present {
            if (self.userEvents![i] == self.theEvent) {
                present = true
            }
            else {
                i++
            }
        }
        return present
    }
    
    func removeEvent() {
        var i = 0
        let n = self.userEvents?.count
        var present = false
        while (i<n) && !present {
            if (self.userEvents![i] == self.theEvent) {
                present = true
            }
            else {
                i++
            }
        }
        self.userEvents?.removeAtIndex(i)
    }

}
