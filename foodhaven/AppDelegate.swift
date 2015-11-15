//
//  AppDelegate.swift
//  foodhaven
//
//  Created by Madhu Samuel on 14/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?


    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyCpR0H-3o6sRwsIAjW-6nw7XOYIVyo3Uf0")
        
        let locationManager = BDLocationManager.instance()
        
        //  Assign the delegates to this class
        locationManager.locationDelegate = self
        locationManager.sessionDelegate  = self
        
        locationManager.authenticateWithApiKey("1762e480-8b36-11e5-84c8-bc305bf60831", packageName: "au.com.foodhaven", username: "foodhavenapp@gmail.com")
        
        return true
    }

    public func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    public func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    public func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    public func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    public func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    var mapViewController : FoodShareMapViewViewController?
}

extension AppDelegate : BDPSessionDelegate {
    
    public func willAuthenticateWithUsername( username: String!, apiKey: String!, packageName: String!) {
        print("willAuthenticateWithUsername")
    }

    public func authenticationWasSuccessful() {
        print("authenticationWasSuccessful")
    }

    public func authenticationWasDeniedWithReason( reason: String!) {
        print("authenticationWasDeniedWithReason")
    }

    public func authenticationFailedWithError( error: NSError!) {
        print("authenticationFailedWithError")
    }

    public func didEndSession() {
        print("didEndSession")
    }
}

extension AppDelegate : BDPLocationDelegate {
    
    
    public func didUpdateZoneInfo(zoneInfos: Set<NSObject>!) {
        
        var zoneInfos2 = [BDZoneInfo]()
        zoneInfos.forEach()
        {
            (zoneInfoObj: NSObject ) in
            zoneInfos2.append( zoneInfoObj as! BDZoneInfo )
        }
        
        
        
        // This gives you access to all the Zones defined in the back-end, in case you want to show them on the map
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        self.mapViewController = storyboard.instantiateViewControllerWithIdentifier("FoodShareMapViewController") as? FoodShareMapViewViewController
        
        var combinedData = RestaurantFactory.createBluedotDummyData(zoneInfos2)
        combinedData += RestaurantFactory.createNewDummyData()
        
        self.mapViewController!.homeRestaurants = combinedData
        
        (window!.rootViewController! as! UINavigationController).pushViewController( self.mapViewController!, animated: true)
    }

    public func didCheckIntoFence( fence: BDFenceInfo?, inZone zoneInfo: BDZoneInfo?, atCoordinate coordinate: BDLocationCoordinate2D, onDate date: NSDate!) {
        
        let zoneName : String = zoneInfo!.name
        let restaurantName : String
        
        if zoneName == "Menu A"
        {
            restaurantName = "Mia's Kitchen"
        }
        else
        {
            restaurantName = "Toms"
        }
        
        let restaurant : HomeRestaurant = mapViewController!.findHomeRestaurant(restaurantName)!
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as? MenuViewController
        
        menuViewController?.homeRestaurant = restaurant
        
        (window!.rootViewController! as! UINavigationController).pushViewController( menuViewController!, animated: true)
    }

    public func didCheckIntoBeacon( beacon: BDBeaconInfo?, inZone zoneInfo: BDZoneInfo?, withProximity proximity: CLProximity, onDate date: NSDate!) {
        
    }

    public func didStartRequiringUserInterventionForBluetooth() {
    
    }

    public func didStopRequiringUserInterventionForBluetooth() {
    
    }

    public func didStartRequiringUserInterventionForLocationServices() {
    
    }

    public func didStopRequiringUserInterventionForLocationServices() {
    
    }

}

