//
//  FoodTableViewController.swift
//  foodhaven
//
//  Created by Madhu Samuel on 15/11/2015.
//  Copyright © 2015 Madhu. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodTitleLabel: UILabel!
    @IBOutlet weak var foodIngredientsLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    var foodItem: FoodItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImageView.image = UIImage(named: foodItem.photo)
        foodTitleLabel.text = foodItem.name
        foodIngredientsLabel.text = foodItem.ingredients
        stockLabel.text = "\(foodItem.stock) \(foodItem.name)s left"
        priceLabel.text = "$\(foodItem.price)"
    }
    
    
    @IBAction func orderButtonTapped(sender: AnyObject) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
