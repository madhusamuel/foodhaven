//
//  LoginTableViewController.swift
//  foodhaven
//
//  Created by Madhu Samuel on 18/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.becomeFirstResponder()
    }
    
    @IBAction func loginButtonTapped(sender: AnyObject) {
        
        guard let userName = userNameTextField.text,
            let password = passwordTextField.text else {
                return
        }
        
        let trimmedUserName = userName.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let trimmedPassword = password.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if (trimmedUserName.isEmpty || trimmedPassword.isEmpty) {
            DisplayUtil.displayAlert("Error", message: "Username and password fields cannot be empty", presentingViewController: self)
        } else {
            
            print("Username & password are \(trimmedUserName)  - \(trimmedPassword)")
            loginWithEmail(trimmedUserName, password: trimmedPassword)
        }
    }
    
    func loginWithEmail(userName: String, password: String) {
        
        ActivityManager.sharedManager().startActivityIndicator(self.view)
        LoginDataService().loginWithUserName(userName, password: password, success: { (user) -> () in
                AppModel.sharedInstance().currentUser = user
                ActivityManager.sharedManager().stopActivityIndicator()
                self.navigationController?.popViewControllerAnimated(true)
            }, failure: {(error) -> () in
                DisplayUtil.displayAlert("Error Code - "+String(error.code), message: error.localizedDescription, presentingViewController: self)
                ActivityManager.sharedManager().stopActivityIndicator()
        })
        closeKeyboard()
    }
    
    func closeKeyboard() {
        self.userNameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
    }
    
}
