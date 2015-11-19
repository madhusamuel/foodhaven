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
        ActivityManager.sharedManager().startActivityIndicator(view)
        LoginDataService().logout({ () -> () in
                AppModel.sharedInstance().currentUser = nil
                ActivityManager.sharedManager().stopActivityIndicator()
                DisplayUtil.displayAlert("Logout", message: "You are logged out", presentingViewController: self)
            }, failure: { (error) -> () in
                DisplayUtil.displayAlert("Error Code - "+String(error.code), message: error.localizedDescription, presentingViewController: self)
                ActivityManager.sharedManager().stopActivityIndicator()
        })
    }

}
