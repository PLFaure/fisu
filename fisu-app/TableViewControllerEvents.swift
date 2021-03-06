//
//  TableViewControllerEvents.swift
//  fisu-app
//
//  Created by IG2013 on 24/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit

class TableViewControllerEvents: UITableViewController {
    var eventsArray:[Event]?
    var theUser: User?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewEvents.delegate = self
        tableViewEvents.dataSource = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    @IBOutlet var tableViewEvents: UITableView!
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsArray!.count
        //attention penser au try/catch ici au lieu du "!"

    }

    //fonction pour convertir les dates en String
    func dateConvert(date: NSDate) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE dd MMMM, h:mm a"
        let dateString = dateFormatter.stringFromDate(date)
        return dateString
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "EventsCell"
        let event = self.eventsArray![indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventsTableViewCell
        cell.nameLabel.text = event.pname
        cell.dateLabel.text = dateConvert(event.pdate!)
        cell.theEvent = event
        if isPresentUserEv(event) {
            cell.added.text = "Added"
        } else {
            cell.added.text = ""
        }
        return cell
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.tableViewEvents.reloadData()
    }
    
    /// Check if the event is present into the class event array.
    /// - parameter ev : Event, the event searched
    /// - returns : Boolean. True if the event is present into the class event array. False if the event is not present.
    func isPresentUserEv(ev: Event) -> Bool {
        var evArray = self.theUser?.pevents!.allObjects as? [Event]
        var i = 0
        let n = evArray?.count
        var present = false
        while (i<n) && !present {
            if (evArray![i] == ev) {
                present = true
            } else {
                i++
            }
        }
        return present
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    //Back button pressed
    override func didMoveToParentViewController(parent: UIViewController?) {
        if (!(parent?.isEqual(self.parentViewController) ?? false)) {
            self.performSegueWithIdentifier("unwindToVC", sender: self)
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "eventDescription" {
            if let nextScene = segue.destinationViewController as? EventViewController{
                let indexpath = self.tableViewEvents.indexPathForSelectedRow
                nextScene.theEvent = self.eventsArray![indexpath!.row]
                nextScene.theEventDateConverter = self.dateConvert(eventsArray![indexpath!.row].pdate!)
                nextScene.theUser = self.theUser
            }
        }
    }

    /// unwind function for the son pages
    /// - parameter segue : the previous page.
    @IBAction func unwindToTVCE(sender:UIStoryboardSegue) {
        if let prevScene = sender.sourceViewController as? EventViewController {
            self.theUser = prevScene.theUser!
            self.tableViewEvents.reloadData()
        }
    }
    


}