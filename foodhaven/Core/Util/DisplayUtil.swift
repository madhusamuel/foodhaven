//
//  DisplayUtil.swift
//  foodhaven
//
//  Created by Madhu Samuel on 19/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import UIKit

class DisplayUtil {
    
    static func displayAlert(title: String?, message: String?, presentingViewController: UIViewController) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alertViewController.addAction(alertAction)
        presentingViewController.presentViewController(alertViewController, animated: true, completion: nil)
    }
    
}