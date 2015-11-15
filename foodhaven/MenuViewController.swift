//
//  MenuViewController.swift
//  foodhaven
//
//  Created by Madhu Samuel on 15/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var homeRestaurant: HomeRestaurant!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeRestaurant.menu.foodItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("menuItem")
        let foodItem = homeRestaurant.menu.foodItems[indexPath.row]
        cell?.textLabel?.text = foodItem.name
        cell?.detailTextLabel?.text = String(foodItem.price)
        return cell!
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFoodItemSegue" {
            let foodViewController = segue.destinationViewController as! FoodTableViewController
            foodViewController.foodItem = homeRestaurant.menu.foodItems[tableView.indexPathForSelectedRow!.row]
        }
    }


}
