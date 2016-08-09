//
//  ListSubscriptionTableViewController.swift
//  iSubscribe
//
//  Created by YK on 7/29/16.
//  Copyright © 2016 Yevgeniy Kim. All rights reserved.
//

import UIKit
import RealmSwift


class ListSubscriptionTableViewController: UITableViewController {
    
    //Some realm stuff that idk what it does really ??
    var subsciptions: Results<Subscription>! {
        didSet {
            tableView.reloadData()
        }
    }
    
    //Table view protocol function - defining the number of rows
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subsciptions.count
    }
    
    //Table view protocol function - defining the cells' contents & index path
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listSubscriptionTableViewCell", forIndexPath: indexPath) as! ListSubscriptionTableViewCell
        
        let row = indexPath.row
        
        let subscription = subsciptions[row]
        
        cell.subscriptionNameLabel.text = subscription.subscriptionName
        
        return cell
    }
    
    //Deleting a subscription from realm
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        if editingStyle == .Delete {

            RealmHelper.deleteSubscription(subsciptions[indexPath.row])
            
            subsciptions = RealmHelper.retriveSubscription()
        }
    }

    //Loads existing subscriptions from realm when the view loads
    override func viewDidLoad() {
        super.viewDidLoad()
        subsciptions = RealmHelper.retriveSubscription()
    }
    
    //Passing information based on which cell is clicked on
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "displaySubscription" {
                print("Table view cell tapped")
                
                
                let indexPath = tableView.indexPathForSelectedRow!
                
                let subscription = subsciptions[indexPath.row]
                
                let displaySubscriptionViewController = segue.destinationViewController as! DisplaySubscriptionTableViewController
                
                displaySubscriptionViewController.subscription = subscription
                
            } else if identifier == "addSubscription" {
                print("+ button tapped")
            }
        }
    }
    
    //Defining unwind segue
    @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue) {
        
    }

}


