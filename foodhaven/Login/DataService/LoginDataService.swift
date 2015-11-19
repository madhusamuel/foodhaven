//
//  LoginDataService.swift
//  foodhaven
//
//  Created by Madhu Samuel on 18/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import Foundation
import Parse

class LoginDataService {
    
    func signUpWithUserName(userName: String, password: String, email: String, phone: String, success: (user: User) -> (), failure: (error: NSError) -> ()) {
        let user = PFUser()
        user.username = userName
        user.password = password
        user.email = email
        user["phone"] = phone
        
        user.signUpInBackgroundWithBlock { (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                failure(error: error)
            } else {
                let user = User(name: userName, password: password, email: email)
                user.phone = phone
                success(user: user)
            }
        }
    }
    
    func loginWithUserName(userName: String, password: String, success: (user: User) -> (), failure: (error: NSError) -> ()) {
        PFUser.logInWithUsernameInBackground(userName, password: password) { (pfUser: PFUser?, error: NSError?) -> Void in
            if let error = error {
                failure(error: error)
            } else {
                let user = User(name: pfUser!.username!)
                success(user: user)
            }
            
        }
    }
    
    func logout(success: () -> (), failure: (error: NSError) -> ()) {
        PFUser.logOutInBackgroundWithBlock { (error: NSError?) -> Void in
            if let error = error {
                failure(error: error)
            }
        }
    }
    
}
