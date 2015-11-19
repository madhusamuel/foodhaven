//
//  DataFactory.swift
//  foodhaven
//
//  Created by Madhu Samuel on 19/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import Foundation
import CoreLocation

class DataFactory {
    
    static let sharedInstance = DataFactory()
    
    // MARK: Dummy Data
    
    func dummyData() -> [HomeRestaurant] {
        let foodItem1 = FoodItem(name: "Pizza", price: 10, stock: 5, ingredients: "Flour", photo: "pizza.jpg")
        let foodItem2 = FoodItem(name: "Chicken Burger", price: 8, stock: 3, ingredients: "Chicken, Bread", photo: "burger.jpg")
        let foodItems = [foodItem1, foodItem2]
        let rest1 = HomeRestaurant(name: "Barbara's Kitchen", location: CLLocationCoordinate2D(latitude: -37.598473, longitude: 144.221200), specialFoodItem: foodItems[0])
        
        rest1.menu = Menu()
        rest1.menu.foodItems = foodItems
        return [rest1]
    }
    
    func createNewDummyData() -> [HomeRestaurant] {
        return [
            createRestaurant("Barbara's Kitchen", location: CLLocationCoordinate2D(latitude: -37.598473, longitude: 144.221200),
                foodItems:
                [FoodItem(name: "Beef Lasangna", price: 10, stock: 5, ingredients: "Beef, Plain Flour, Egg, cream, garlic, onion, Olive Oil, pasta sause, red wine, cheddar cheese, parmesan cheese", photo: "beef_lasagna"),
                    FoodItem(name: "Chocolate Chip Cookie", price: 2, stock: 30, ingredients: "Plain flour, egg, butter, sugar, chocolate chips", photo: "chocolate_chip_cookie")],
                photo: "elderly_women_in_kitchen"),
            createRestaurant("Sarah's Kitchen", location: CLLocationCoordinate2D(latitude: -37.601637, longitude: 144.223335),
                foodItems:
                [FoodItem(name: "Pizza(Veg)", price: 13, stock: 2, ingredients: "Silverbeet, broccolini and mozzarella pizza", photo: "pizza2"),
                    FoodItem(name: "Pizza(Non-veg)", price: 13, stock: 2, ingredients: "Chicken, mushroom and mozzarella pizza", photo: "pizza1"),
                    FoodItem(name: "Meat Loaf", price: 10, stock: 5, ingredients: "veal mince, garlic, onion, breadcrumbs, egg, worcestershire sause, steamed green beans and gravy to serve", photo: "meat_loaf")],
                photo: "US_family_in_kitchen"),
            createRestaurant("Spicy Kitchen", location: CLLocationCoordinate2D(latitude: -37.603344, longitude: 144.223346),
                foodItems:
                [FoodItem(name: "Indian Roti", price: 10, stock: 5, ingredients: "Wheat Flour, salt, olive oil", photo: "chapati"),
                    FoodItem(name: "Spicy Goat Curry", price: 2, stock: 30, ingredients: "Goat, ginger, garlic, onion, tomato, garam masala, chilli, curry leaves, coconut oil", photo: "goat_curry")],
                photo: "family_in_kitchen"),
            createRestaurant("Eva's Kitchen", location: CLLocationCoordinate2D(latitude: -37.602282, longitude: 144.231143),
                foodItems:
                [FoodItem(name: "Masala Dosa", price: 10, stock: 5, ingredients: "Rice, Urud Dhal, Potato, chilli, tomato, turmeric, ginger", photo: "masala_dosa")],
                photo: "granny_kid_in_kitchen"),
            createRestaurant("Mia's Kitchen", location: CLLocationCoordinate2D(latitude: -37.602169, longitude: 144.233822),
                foodItems:
                [FoodItem(name: "Pasta", price: 11, stock: 4, ingredients: "Wheat Flour, salt, olive oil", photo: "pasta")],
                photo: "old_man_in_kitchen"),
            createRestaurant("Toms", location: CLLocationCoordinate2D(latitude: -37.600729, longitude: 144.236548),
                foodItems:
                [FoodItem(name: "Pasta", price: 11, stock: 4, ingredients: "Wheat Flour, salt, olive oil", photo: "pasta")],
                photo: "man_in_kitchen")
        ]
    }
    
    let gap = 0.002
    
    func createNewDummyData(currentLocation: CLLocationCoordinate2D) -> [HomeRestaurant] {
        return [
            createRestaurant("Barbara's Kitchen", location: CLLocationCoordinate2D(latitude: currentLocation.latitude - 1*gap, longitude: currentLocation.longitude + 1*gap),
                foodItems:
                [FoodItem(name: "Beef Lasangna", price: 10, stock: 5, ingredients: "Beef, Plain Flour, Egg, cream, garlic, onion, Olive Oil, pasta sause, red wine, cheddar cheese, parmesan cheese", photo: "beef_lasagna"),
                    FoodItem(name: "Chocolate Chip Cookie", price: 2, stock: 30, ingredients: "Plain flour, egg, butter, sugar, chocolate chips", photo: "chocolate_chip_cookie")],
                photo: "elderly_women_in_kitchen"),
            createRestaurant("Sarah's Kitchen", location: CLLocationCoordinate2D(latitude: currentLocation.latitude + 2*gap, longitude: currentLocation.longitude + 1*gap),
                foodItems:
                [FoodItem(name: "Pizza(Veg)", price: 13, stock: 2, ingredients: "Silverbeet, broccolini and mozzarella pizza", photo: "pizza2"),
                    FoodItem(name: "Pizza(Non-veg)", price: 13, stock: 2, ingredients: "Chicken, mushroom and mozzarella pizza", photo: "pizza1"),
                    FoodItem(name: "Meat Loaf", price: 10, stock: 5, ingredients: "veal mince, garlic, onion, breadcrumbs, egg, worcestershire sause, steamed green beans and gravy to serve", photo: "meat_loaf")],
                photo: "US_family_in_kitchen"),
            createRestaurant("Spicy Kitchen", location: CLLocationCoordinate2D(latitude: currentLocation.latitude - 2.5*gap, longitude: currentLocation.longitude + 2*gap),
                foodItems:
                [FoodItem(name: "Indian Roti", price: 10, stock: 5, ingredients: "Wheat Flour, salt, olive oil", photo: "chapati"),
                    FoodItem(name: "Spicy Goat Curry", price: 2, stock: 30, ingredients: "Goat, ginger, garlic, onion, tomato, garam masala, chilli, curry leaves, coconut oil", photo: "goat_curry")],
                photo: "family_in_kitchen"),
            createRestaurant("Eva's Kitchen", location: CLLocationCoordinate2D(latitude: currentLocation.latitude - 3*gap, longitude: currentLocation.longitude - 3*gap),
                foodItems:
                [FoodItem(name: "Masala Dosa", price: 10, stock: 5, ingredients: "Rice, Urud Dhal, Potato, chilli, tomato, turmeric, ginger", photo: "masala_dosa")],
                photo: "granny_kid_in_kitchen"),
            createRestaurant("Mia's Kitchen", location: CLLocationCoordinate2D(latitude: currentLocation.latitude + 5*gap, longitude: currentLocation.longitude - 2*gap),
                foodItems:
                [FoodItem(name: "Pasta", price: 11, stock: 4, ingredients: "Wheat Flour, salt, olive oil", photo: "pasta")],
                photo: "old_man_in_kitchen"),
            createRestaurant("Toms", location: CLLocationCoordinate2D(latitude: currentLocation.latitude - 1.5*gap, longitude: currentLocation.longitude - 3*gap),
                foodItems:
                [FoodItem(name: "Pasta", price: 11, stock: 4, ingredients: "Wheat Flour, salt, olive oil", photo: "pasta")],
                photo: "man_in_kitchen")
        ]
    }
    
    func createRestaurant(name: String, location: CLLocationCoordinate2D, foodItems: [FoodItem], photo: String) -> HomeRestaurant {
        let homeRestaurant = HomeRestaurant(name: name, location: location, specialFoodItem: foodItems[0])
        homeRestaurant.photoName = photo
        homeRestaurant.menu = Menu()
        homeRestaurant.menu.foodItems = foodItems
        return homeRestaurant
    }

}