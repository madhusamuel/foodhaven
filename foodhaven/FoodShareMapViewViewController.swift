//
//  FoodShareMapViewViewController.swift
//  foodhaven
//
//  Created by Madhu Samuel on 14/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import UIKit
import GoogleMaps

class FoodShareMapViewViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let latitudeOfMelbourne = -37.8136
    let longitudeOfMelbourne = 144.9631
    
    var locationManager: CLLocationManager?
    
    //,latitude: -37.602282, longitude: 144.231143
    
    var homeRestaurants: [HomeRestaurant] = []
    
    var currentMarker: GMSMarker?
    var currentLocation: CLLocationCoordinate2D!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeRestaurants = DataFactory.sharedInstance.createNewDummyData() //dummyData()
        setupMap()
        findLocation()
    }
    
    // MARK: - Setup methods
    
    private func setupMap() {
        let camera = GMSCameraPosition.cameraWithLatitude(latitudeOfMelbourne,
            longitude: longitudeOfMelbourne, zoom: 14.5)
        mapView.camera = camera
        mapView.myLocationEnabled = true
        self.view = mapView
        mapView.delegate = self
    }
    
    func findLocation() {
        self.title = "Locating You..."
        if (locationManager == nil) {
            locationManager = CLLocationManager()
        }
        locationManager?.delegate = self
        
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.distanceFilter = 100 // meteres
        locationManager?.requestWhenInUseAuthorization()
        ActivityManager.sharedManager().startActivityIndicator(view)
        locationManager?.requestLocation()
    }
    
    //MARK: locationManagerDelegate
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Invoking didUpdateLocations")
        if (locations.count > 0) {
            print("Location -> \(locations[0])")
            self.title = "Nearby Kitchens"
            self.currentLocation = locations[0].coordinate
            self.updateMap(self.currentLocation)
            self.homeRestaurants = DataFactory.sharedInstance.createNewDummyData(self.currentLocation)
            self.addMarkers()
            ActivityManager.sharedManager().stopActivityIndicator()
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Location update FAILED")
    }
    
    func updateMap(currentLocation: CLLocationCoordinate2D) {
        let camera = GMSCameraPosition.cameraWithLatitude(currentLocation.latitude,
            longitude: currentLocation.longitude, zoom: 14.5)
        mapView.camera = camera
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
//            let cameraPosition = GMSCameraPosition(target: marker.position, zoom: 15, bearing: mapView.camera.bearing, viewingAngle: mapView.camera.viewingAngle)
//            mapView.animateToCameraPosition(cameraPosition)
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

}
