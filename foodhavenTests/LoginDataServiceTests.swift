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
        let expectation = expectationWithDescription("signup")
        let loginDataService = LoginDataService()
        loginDataService.signUpWithUserName("testuser1", password:"password", email:"testuser1@t.com", phone:"0411112222", success: { (user) -> () in
                XCTAssertEqual(user.name, "testuser1", "User signed up")
            expectation.fulfill()
            }, failure: { (error) -> () in
                //[Error]: username testuser1 already taken (Code: 202, Version: 1.9.1)
                XCTAssertEqual(error.code, 202, "username already exists")
                expectation.fulfill()
        })
        waitForExpectationsWithTimeout(5) { (error) -> Void in
            print("Timeout \(error)")
        }
    }
    
    func testLogin() {
        let expectation = expectationWithDescription("login")
        let loginDataService = LoginDataService()
        loginDataService.loginWithUserName("testuser1", password:"password", success: { (user) -> () in
                XCTAssertEqual(user.name, "testuser1", "login")
                expectation.fulfill()
            }, failure: { (error) -> () in
                print("Signup failed:\(error)")
                expectation.fulfill()
        })
        waitForExpectationsWithTimeout(5) { (error) -> Void in
            print("Timeout \(error)")
        }
    }
    
}
