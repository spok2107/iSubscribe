//
//  Subscription.swift
//  iSubscribe
//
//  Created by YK on 8/1/16.
//  Copyright © 2016 Yevgeniy Kim. All rights reserved.
//

import Foundation
import RealmSwift

class Subscription: Object {
    
    dynamic var username: String = ""
    dynamic var password: String = ""
    dynamic var subscriptionName: String = ""
    dynamic var billCycle: String = ""
    dynamic var billRate: String = ""
    dynamic var reminder: String = ""
    dynamic var firstBillDate = NSDate()
    
}