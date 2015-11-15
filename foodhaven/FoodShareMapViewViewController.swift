//
//  FoodShareMapViewViewController.swift
//  foodhaven
//
//  Created by Madhu Samuel on 14/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import UIKit
import GoogleMaps

class FoodShareMapViewViewController: UIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    //TODO change to current location co-ordinates
//    let latitudeOfMelbourne = -37.591291
//    let longitudeOfMelbourne = 144.202203
    let latitudeOfMelbourne = -37.599705
    let longitudeOfMelbourne = 144.227555
    
    //,
    
    var homeRestaurants: [HomeRestaurant] = []
    
    var currentMarker: GMSMarker?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeRestaurants = createNewDummyData() //dummyData()
        setupMap()
        addMarkers()
    }
    
    // MARK: - Setup methods
    
    private func setupMap() {
        let camera = GMSCameraPosition.cameraWithLatitude(latitudeOfMelbourne,
            longitude: longitudeOfMelbourne, zoom: 15)
        mapView.camera = camera
        mapView.myLocationEnabled = true
        self.view = mapView
        mapView.delegate = self
    }
    
    func addMarkers() {
        for homeRestaurant in homeRestaurants {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake(homeRestaurant.location.latitude, homeRestaurant.location.longitude)
            marker.title = homeRestaurant.name
            marker.snippet = homeRestaurant.specialFoodItem.name
            marker.appearAnimation = kGMSMarkerAnimationPop
            marker.map = mapView
            currentMarker = marker
            let cameraPosition = GMSCameraPosition(target: marker.position, zoom: 15, bearing: mapView.camera.bearing, viewingAngle: mapView.camera.viewingAngle)
            mapView.animateToCameraPosition(cameraPosition)
        }
        
    }
    
    // MARK: - GMSMapViewDelegate
    var selectedHomeRestaurant: HomeRestaurant?
    func mapView(mapView: GMSMapView!, didTapInfoWindowOfMarker marker: GMSMarker!) {
        print("tapped me at \(marker.position)")
        selectedHomeRestaurant = findHomeRestaurant(marker.title)
        performSegueWithIdentifier("showMenuSegue", sender: self)
    }
    
    func findHomeRestaurant(restaurantName: String) -> HomeRestaurant? {
        for restaurant in homeRestaurants {
            if restaurant.name == restaurantName {
                return restaurant
            }
        }
        return nil
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMenuSegue" {
            let menuViewController = segue.destinationViewController as! MenuViewController
            menuViewController.homeRestaurant = selectedHomeRestaurant
        }
    }
    
    // MARK: Dummy Data
    
    func dummyData() -> [HomeRestaurant] {
        let foodItem1 = FoodItem(name: "Pizza", price: 10, stock: 5, ingredients: "Flour", photo: "pizza.jpg")
        let foodItem2 = FoodItem(name: "Chicken Burger", price: 8, stock: 3, ingredients: "Chicken, Bread", photo: "burger.jpg")
        let foodItems = [foodItem1, foodItem2]
        let rest1 = HomeRestaurant(name: "Barbara's Kitchen", location: CLLocationCoordinate2D(latitude: -37.598473, longitude: 144.221200), specialFoodItem: foodItems[0])
        
        rest1.menu = Menu()
        rest1.menu.photo = "Kitchen1.jpg"
        rest1.menu.foodItems = foodItems
        return [rest1]
    }
    
    func createNewDummyData() -> [HomeRestaurant] {
        return [
            createRestaurant("Barbara's Kitchen", location: CLLocationCoordinate2D(latitude: -37.598473, longitude: 144.221200),
                foodItems:
                    [FoodItem(name: "Pizza", price: 10, stock: 5, ingredients: "Flour", photo: "pizza.jpg"),
                    FoodItem(name: "Pizza", price: 10, stock: 5, ingredients: "Flour", photo: "pizza.jpg")],
                photo: "kitchen1.jpg"),
            createRestaurant("Barbara's Kitchen", location: CLLocationCoordinate2D(latitude: -37.601637, longitude: 144.223335),
                foodItems:
                [FoodItem(name: "Pizza", price: 10, stock: 5, ingredients: "Flour", photo: "pizza.jpg"),
                    FoodItem(name: "Pizza", price: 10, stock: 5, ingredients: "Flour", photo: "pizza.jpg")],
                photo: "kitchen1.jpg")
        ]
    }
    
    func createBluedotDummyData( zoneInfos: [BDZoneInfo] ) -> [HomeRestaurant] {
        var homeRestaurants = Array<HomeRestaurant>()
        for zoneInfo in zoneInfos {
            let homeRestaurant : HomeRestaurant
            switch zoneInfo.ID
            {
                case "63a945db-ec2e-4158-af03-bd826c721b0f": // Menu A
                    homeRestaurant = createRestaurant(<#T##name: String##String#>, location: <#T##CLLocationCoordinate2D#>, foodItems: <#T##[FoodItem]#>, photo: <#T##String#>)
                
                case "e796310a-0825-4170-9e60-072919b83424": // Menu B
                    homeRestaurant = createRestaurant("Menu B", location: <#T##CLLocationCoordinate2D#>, foodItems: <#T##[FoodItem]#>, photo: <#T##String#>)
            }
            homeRestaurants.append(homeRestaurant)
        }
        return homeRestaurants
    }
    
    func createRestaurant(name: String, location: CLLocationCoordinate2D, foodItems: [FoodItem], photo: String) -> HomeRestaurant {
        let homeRestaurant = HomeRestaurant(name: name, location: location, specialFoodItem: foodItems[0])
        homeRestaurant.menu = Menu()
        homeRestaurant.menu.photo = photo
        homeRestaurant.menu.foodItems = foodItems
        return homeRestaurant
    }


}
