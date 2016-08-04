//
//  DisplaySubsciptionTableViewController.swift
//  iSubscribe
//
//  Created by YK on 8/1/16.
//  Copyright © 2016 Yevgeniy Kim. All rights reserved.
//

import UIKit

class DisplaySubsciptionTableViewController: UITableViewController {
    
    var subscription: Subscription?
    
    @IBOutlet weak var subscriptionNameTextField: UITextField!

    @IBOutlet weak var subscriptionBillRateTextLabel: UILabel!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let subscription = subscription {
        
            subscriptionNameTextField.text = subscription.subscriptionName
            subscriptionBillRateTextLabel.text = subscription.billRate
        } else {
            
            subscriptionNameTextField.text = ""
            subscriptionBillRateTextLabel.text = ""
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Save" {
            let listSubscriptionTableViewController = segue.destinationViewController as! ListSubscriptionTableViewController

            if let subscription = subscription {
                
                subscription.subscriptionName = subscriptionNameTextField.text ?? ""
                subscription.billRate = subscriptionBillRateTextLabel.text ?? ""
                
                listSubscriptionTableViewController.tableView.reloadData()

            } else {
                
                let newSubscription = Subscription()
                newSubscription.subscriptionName = subscriptionNameTextField.text ?? ""
                newSubscription.billRate = subscriptionBillRateTextLabel.text ?? ""
                listSubscriptionTableViewController.subsciptions.append(newSubscription)
            
            }
        }
        
        if let identifier = segue.identifier {
            
            if identifier == "displayBillRate" {
                
                print("Transitioning to the Display Subscription Table View Controller")
            }
        }
    }
    

    @IBAction func unwindToDisplayBillRateViewController(segue: UIStoryboardSegue) {
        
        
    }

    
    
}



