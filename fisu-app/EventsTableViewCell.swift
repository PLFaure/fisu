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
    @IBOutlet weak var addRemSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
   

}
