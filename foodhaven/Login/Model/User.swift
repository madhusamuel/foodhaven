//
//  User.swift
//  foodhaven
//
//  Created by Madhu Samuel on 18/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import Foundation

class User {
    var name: String
    var password: String
    var email: String
    
    init(name: String, password: String, email: String) {
        self.name = name
        self.password = password
        self.email = email
    }
}