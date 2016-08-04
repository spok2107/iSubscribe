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

        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "Save" {
                print("Save button tapped")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

   
}
