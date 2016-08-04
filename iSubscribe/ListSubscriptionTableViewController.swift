//
//  ListSubscriptionTableViewController.swift
//  iSubscribe
//
//  Created by YK on 7/29/16.
//  Copyright © 2016 Yevgeniy Kim. All rights reserved.
//

import UIKit

class ListSubscriptionTableViewController: UITableViewController {
    
    var subsciptions = [Subscription]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subsciptions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("listSubscriptionTableViewCell", forIndexPath: indexPath) as! ListSubscriptionTableViewCell
        
        let row = indexPath.row
        
        let subscription = subsciptions[row]
        
        cell.subscriptionNameLabel.text = subscription.subscriptionName
        
        cell.amountToBePaidLabel.text = subscription.billRate
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

        if editingStyle == .Delete {

            subsciptions.removeAtIndex(indexPath.row)
    
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "displaySubscription" {
                print("Table view cell tapped")
                
                
                let indexPath = tableView.indexPathForSelectedRow!
                
                let subscription = subsciptions[indexPath.row]
                
                let displaySubscriptionViewController = segue.destinationViewController as! DisplaySubsciptionTableViewController
                
                displaySubscriptionViewController.subscription = subscription
                
            } else if identifier == "addSubscription" {
                print("+ button tapped")
            }
        }
    }
    
    
    
    
    @IBAction func unwindToListNotesViewController(segue: UIStoryboardSegue) {
        
    }

}


