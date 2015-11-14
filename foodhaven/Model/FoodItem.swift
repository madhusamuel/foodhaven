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
    var ingredients: String
    var photo: String
    
    init(name: String, price: Float, ingredients: String, photo: String) {
        self.name = name
        self.price = price
        self.ingredients = ingredients
        self.photo = photo
    }
}