//
//  DisplayBillRateTableViewController.swift
//  iSubscribe
//
//  Created by YK on 8/3/16.
//  Copyright © 2016 Yevgeniy Kim. All rights reserved.
//

import UIKit

class DisplayBillRateViewController: UIViewController {
    
    @IBOutlet weak var billRateTextField: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        billRateTextField.text = ""
    }

        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "saveToSubscription" {
                print("Save to subscription button tapped")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

   
}
