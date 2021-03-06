//
//  TableViewControllerResto.swift
//  fisu-app
//
//  Created by IG2013 on 23/03/2016.
//  Copyright © 2016 Faure Geoffray. All rights reserved.
//

import UIKit

class TableViewControllerResto: UITableViewController{
    var restaurantsArray:[Restaurant]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewRestau.delegate = self
        tableViewRestau.dataSource = self
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
    @IBOutlet var tableViewRestau: UITableView!

    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray!.count
        //attention penser au try/catch ici au lieu du "!"
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "RestaurantsCell"
        let restaurant = self.restaurantsArray![indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestoTableViewCell
        cell.nameLabel.text = restaurant.pname
        return cell
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

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "RestoSegue" {
            if let nextScene = segue.destinationViewController as? RestoViewController{
                let indexpath = self.tableViewRestau.indexPathForSelectedRow
                nextScene.theResto = self.restaurantsArray![indexpath!.row]
            }
        }
    }
    

}
