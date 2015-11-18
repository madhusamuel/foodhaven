//
//  LoginDataServiceTests.swift
//  foodhaven
//
//  Created by Madhu Samuel on 18/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import XCTest
@testable import foodhaven

class LoginDataServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSignUp() {
        var loginDataService = LoginDataService()
        loginDataService.singUpWithUserName("madhu", password:"password", email:"madhusamuel@gmail.com", success: { (user) in
            
            }, failure: { (error) in
                
        })
    }
    
}
