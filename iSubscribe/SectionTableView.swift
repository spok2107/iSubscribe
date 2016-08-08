//
//  SectionTableView.swift
//  iSubscribe
//
//  Created by YK on 8/7/16.
//  Copyright © 2016 Yevgeniy Kim. All rights reserved.
//

import UIKit

class SectionTableView: UITableView {
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        header.textLabel?.textColor = UIColor.redColor()
    }


}
