//
//  FoodMenuListViewController.swift
//  foodhaven
//
//  Created by Madhu Samuel on 19/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import UIKit

class FoodMenuListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var masterFoodList: [FoodItem] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppModel.sharedInstance().homeRestaurants = DataFactory.sharedInstance.createNewDummyData()
        self.masterFoodList = createMasterFoodList(AppModel.sharedInstance().homeRestaurants)
    }
    
    func createMasterFoodList(homeRestaurants: [HomeRestaurant]) -> [FoodItem] {
        var foodItemList: [FoodItem] = []
        for homeRestaurant in homeRestaurants {
            if let menu = homeRestaurant.menu {
                foodItemList += menu.foodItems
            }
        }
        return foodItemList
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masterFoodList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("foodMenuListTableViewCell") as! FoodMenuListTableViewCell
        let foodItem = masterFoodList[indexPath.row]
        cell.foodImageView?.image = UIImage(named: foodItem.photo)
        cell.foodTitleLabel.text = foodItem.name
        cell.foodRateLabel.text = "Price: $\(foodItem.price)"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFoodItemSegueFromMenuList" {
            let foodViewController = segue.destinationViewController as! FoodTableViewController
            foodViewController.foodItem = masterFoodList[tableView.indexPathForSelectedRow!.row]
        }
    }


}
