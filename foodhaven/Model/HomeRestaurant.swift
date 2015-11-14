//
//  HomeRestaurant.swift
//  foodhaven
//
//  Created by Madhu Samuel on 15/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import Foundation
import CoreLocation

class HomeRestaurant {
    
    var name: String
    var location: CLLocationCoordinate2D
    var menu: Menu!
    
    init(name: String, location: CLLocationCoordinate2D) {
        self.name = name
        self.location = location
    }
    
}