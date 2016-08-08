//
//  DisplaySubsciptionTableViewController.swift
//  iSubscribe
//
//  Created by YK on 8/1/16.
//  Copyright © 2016 Yevgeniy Kim. All rights reserved.
//

import UIKit
import RealmSwift

class DisplaySubscriptionTableViewController: UITableViewController {
    
    var subscription: Subscription?
    
    @IBOutlet weak var subscriptionNameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
   
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var billCycleTextField: UITextField!
   
    @IBOutlet weak var billRateTextField: UITextField!
    
    @IBOutlet weak var reminderTextField: UITextField!

    @IBOutlet weak var firstBillDateDatePicker: UIDatePicker!
    
//    @IBOutlet weak var tableView: UITableView!
    

    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRectMake(0, 92, 414, 44)) //set these values as necessary
        returnedView.backgroundColor = UIColor(red: 112.0/255.0, green: 190.0/255.0, blue: 249.0/255.0, alpha: 1.0)
//        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
//        
//        header.textLabel?.textColor = UIColor.redColor()
       
        return returnedView
    }
    
//    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
//        
//        header.textLabel?.textColor = UIColor.redColor()
//    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        if let subscription = subscription {
        
            subscriptionNameTextField.text = subscription.subscriptionName
            usernameTextField.text = subscription.username
            passwordTextField.text = subscription.password
            billCycleTextField.text = subscription.billCycle
            billRateTextField.text = subscription.billRate
            reminderTextField.text = subscription.reminder
            firstBillDateDatePicker.date = subscription.firstBillDate
            
        } else {
            
            subscriptionNameTextField.text = ""
            usernameTextField.text = ""
            passwordTextField.text = ""
            billCycleTextField.text = ""
            billRateTextField.text = ""
            reminderTextField.text = ""
            firstBillDateDatePicker.date = NSDate()
            print("Test \(firstBillDateDatePicker.date)")

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstBillDateDatePicker.setValue(UIColor.whiteColor(), forKey: "textColor")
    }
    
  
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Save" {
            let listSubscriptionTableViewController = segue.destinationViewController as! ListSubscriptionTableViewController

            if let subscription = subscription {
                
                 let newSubscription = Subscription()
                newSubscription.subscriptionName = subscriptionNameTextField.text ?? ""
                newSubscription.username = usernameTextField.text ?? ""
                newSubscription.password = passwordTextField.text ?? ""
                newSubscription.billCycle = billCycleTextField.text ?? ""
                newSubscription.billRate = billRateTextField.text ?? ""
                newSubscription.reminder = reminderTextField.text ?? ""
                RealmHelper.updateSubscription(subscription, newSubscription: newSubscription)

            } else {
                
                let subscription = Subscription()
                subscription.subscriptionName = subscriptionNameTextField.text ?? ""
                subscription.username = usernameTextField.text ?? ""
                subscription.password = passwordTextField.text ?? ""
                subscription.billCycle = billCycleTextField.text ?? ""
                subscription.billRate = billRateTextField.text ?? ""
                subscription.reminder = reminderTextField.text ?? ""
                RealmHelper.addSubscription(subscription)
            }
            
                listSubscriptionTableViewController.subsciptions = RealmHelper.retriveSubscription()
            
            
        }
    }
    
//        if let identifier = segue.identifier {
//            
//            if identifier == "displayBillRate" {
//                
//                print("Transitioning to the Display Subscription Table View Controller")
//            }
//        }
    

    @IBAction func unwindToDisplayBillRateViewController(segue: UIStoryboardSegue) {
        
        
    }

    
    
}



