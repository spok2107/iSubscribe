//
//  RealmHelper.swift
//  iSubscribe
//
//  Created by YK on 8/4/16.
//  Copyright © 2016 Yevgeniy Kim. All rights reserved.
//

import Foundation
import RealmSwift

class RealmHelper {
    
    static func addSubscription(subscription: Subscription) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(subscription)
        }
    }
    
    static func deleteSubscription(subscription: Subscription) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(subscription)
        }
    }
    
    static func updateSubscription(subscriptionToBeUpdate: Subscription, newSubscription: Subscription) {
        let realm = try! Realm()
        try! realm.write() {
            subscriptionToBeUpdate.subscriptionName = newSubscription.subscriptionName
            subscriptionToBeUpdate.username = newSubscription.username
            subscriptionToBeUpdate.password = newSubscription.password
            subscriptionToBeUpdate.billCycle = newSubscription.billCycle
            subscriptionToBeUpdate.billRate = newSubscription.billRate
            subscriptionToBeUpdate.reminder = newSubscription.reminder
            subscriptionToBeUpdate.firstBillDate = newSubscription.firstBillDate
            subscriptionToBeUpdate.firstBillDateString = newSubscription.firstBillDateString
            
        }
        
    }
    static func retriveSubscription() -> Results<Subscription> {
        let realm = try! Realm()
        return realm.objects(Subscription).sorted("subscriptionName", ascending: true)
    }

}
