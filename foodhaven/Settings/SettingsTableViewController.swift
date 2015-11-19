//
//  SettingsTableViewController.swift
//  foodhaven
//
//  Created by Madhu Samuel on 18/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    let LOGOUT_INDEXPATH = 2
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == LOGOUT_INDEXPATH) {
            logout()
        }
    }
    
    func logout() {
        LoginDataService().logout({ () -> () in
                AppModel.sharedInstance().currentUser = nil
            }, failure: { (error) -> () in
                print("logout failed \(error)")
        })
    }

}
