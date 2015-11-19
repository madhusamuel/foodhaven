//
//  AppModel.swift
//  foodhaven
//
//  Created by Madhu Samuel on 19/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import Foundation

class AppModel {
    var currentUser: User?
    var homeRestaurants: [HomeRestaurant] = []
    
    private static let instance = AppModel()
    
    static func sharedInstance() -> AppModel {
        return instance
    }
}
