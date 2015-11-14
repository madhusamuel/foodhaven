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
        self.homeRestaurants = dummyData()
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
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(homeRestaurants[0].location.latitude, homeRestaurants[0].location.longitude)
        marker.title = homeRestaurants[0].name
        marker.snippet = homeRestaurants[0].specialFoodItem.name
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = mapView
        currentMarker = marker
        let cameraPosition = GMSCameraPosition(target: marker.position, zoom: 15, bearing: mapView.camera.bearing, viewingAngle: mapView.camera.viewingAngle)
        mapView.animateToCameraPosition(cameraPosition)
    }
    
    // MARK: - GMSMapViewDelegate
    
    func mapView(mapView: GMSMapView!, didTapInfoWindowOfMarker marker: GMSMarker!) {
        print("tapped me at \(marker.position)")
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string:"comgooglemaps://")!)) {
            UIApplication.sharedApplication().openURL(NSURL(string:
                "comgooglemapsurl://?&daddr=\(marker.position.latitude),\(marker.position.longitude)&directionsmode=walking")!)
        } else {
            print("Can't use comgooglemaps://");
            let alertController = UIAlertController(title: nil, message: "Unable to open google maps! You need to run this app in an iOS 9 device.", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                alertController.dismissViewControllerAnimated(false, completion: nil)
            }
            alertController.addAction(okAction)
            presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
    func dummyData() -> [HomeRestaurant] {
        let rest1 = HomeRestaurant(name: "Barbara's Kitchen", location: CLLocationCoordinate2D(latitude: -37.598473, longitude: 144.221200), specialFoodItem: FoodItem(name: "Pizza", price: 10))
        return [rest1]
    }

}
