//
//  FoodItem.swift
//  foodhaven
//
//  Created by Madhu Samuel on 15/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import Foundation

class FoodItem {
    
    var name: String
    var price: Float
    var stock: Int!
    var ingredients: [String] = []
    
    init(name: String, price: Float) {
        self.name = name
        self.price = price
    }
}