//
//  DisplaySubsciptionTableViewController.swift
//  iSubscribe
//
//  Created by YK on 8/1/16.
//  Copyright © 2016 Yevgeniy Kim. All rights reserved.
//

import UIKit
import RealmSwift

var strDate = ""

class DisplaySubscriptionTableViewController: UITableViewController {
    
    var subscription: Subscription?
    
    @IBOutlet weak var subscriptionNameTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
   
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var billCycleTextField: UITextField!
   
    @IBOutlet weak var billRateTextField: UITextField!
    
    @IBOutlet weak var reminderSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var firstBillDateDatePicker: UIDatePicker!
    
    @IBOutlet weak var selectedDate: UILabel!
    
    
    var dateFormatter = NSDateFormatter()
    
    @IBAction func datePickerAction(sender: AnyObject) {
        dateFormatter.dateFormat = "dd-MM-yyyy"
        var strDate = dateFormatter.stringFromDate(firstBillDateDatePicker.date)
        self.selectedDate.text = strDate
    }
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let returnedView = UIView(frame: CGRectMake(0, 92, 414, 44))
        returnedView.backgroundColor = UIColor(red: 112.0/255.0, green: 190.0/255.0, blue: 249.0/255.0, alpha: 1.0)

       
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
            firstBillDateDatePicker.date = subscription.firstBillDate
            reminderSegmentedControl.selectedSegmentIndex = subscription.reminder
            selectedDate.text = subscription.firstBillDateString
            reminderSegmentedControl.selectedSegmentIndex = subscription.reminder
            print("sub = sub")
            
        } else {
            
            subscriptionNameTextField.text = ""
            usernameTextField.text = ""
            passwordTextField.text = ""
            billCycleTextField.text = ""
            billRateTextField.text = ""
            firstBillDateDatePicker.date = NSDate()
            selectedDate.text = dateFormatter.stringFromDate(NSDate())
            print("Test \(firstBillDateDatePicker.date)")
            print("sub != sub")

        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstBillDateDatePicker.setValue(UIColor.whiteColor(), forKey: "textColor")
        let billDate = subscription?.firstBillDate
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        strDate = dateFormatter.stringFromDate(firstBillDateDatePicker.date)
        //self.selectedDate.text = strDate
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
                newSubscription.reminder = reminderSegmentedControl.selectedSegmentIndex
                newSubscription.firstBillDate = firstBillDateDatePicker.date ?? NSDate()
                newSubscription.firstBillDateString = selectedDate.text ?? ""
                RealmHelper.updateSubscription(subscription, newSubscription: newSubscription)

            } else {
                
                let subscription = Subscription()
                subscription.subscriptionName = subscriptionNameTextField.text ?? ""
                subscription.username = usernameTextField.text ?? ""
                subscription.password = passwordTextField.text ?? ""
                subscription.billCycle = billCycleTextField.text ?? ""
                subscription.billRate = billRateTextField.text ?? ""
                subscription.reminder = reminderSegmentedControl.selectedSegmentIndex
                subscription.firstBillDateString = selectedDate.text ?? ""
                subscription.firstBillDate = firstBillDateDatePicker.date ?? NSDate()
                
                RealmHelper.addSubscription(subscription)
            }
            
                listSubscriptionTableViewController.subsciptions = RealmHelper.retriveSubscription()
            
        }
    }
    
    func setSubscriptionDate(){
        if let subscription = subscription{
            subscription.firstBillDate = firstBillDateDatePicker.date
        }
    }
    

    @IBAction func unwindToDisplayBillRateViewController(segue: UIStoryboardSegue) {
        
    }

}



