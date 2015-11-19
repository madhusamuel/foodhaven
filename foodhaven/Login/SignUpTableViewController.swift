//
//  SignUpTableViewController.swift
//  foodhaven
//
//  Created by Madhu Samuel on 19/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import UIKit

class SignUpTableViewController: UITableViewController {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.becomeFirstResponder()
    }
    
    @IBAction func signUpButtonTapped(sender: AnyObject) {
        guard let userName = userNameTextField.text,
            let password = passwordTextField.text,
                let email = emailTextField.text,
                    let phoneNumber = phoneNumberTextField.text  else {
                return
        }
        
        let trimmedUserName = userName.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let trimmedPassword = password.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let trimmedEmail = email.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        let trimmedPhoneNumber = phoneNumber.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        if (trimmedUserName.isEmpty || trimmedPassword.isEmpty || trimmedEmail.isEmpty || trimmedPhoneNumber.isEmpty) {
            DisplayUtil.displayAlert("Error", message: "Username, password, email and phone number fields cannot be empty", presentingViewController: self)
        } else {
            print("Username & password are \(trimmedUserName)  - \(trimmedPassword)")
            signUpWithEmail(trimmedUserName, password: trimmedPassword, email: trimmedEmail, phoneNumber: trimmedPhoneNumber)
        }
    }
    
    func signUpWithEmail(userName: String, password: String, email: String, phoneNumber: String) {
        
        ActivityManager.sharedManager().startActivityIndicator(self.view)
        LoginDataService().signUpWithUserName(userName, password: password, email: email, phone: phoneNumber, success: { (user) -> () in
                AppModel.sharedInstance().currentUser = user
                ActivityManager.sharedManager().stopActivityIndicator()
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
