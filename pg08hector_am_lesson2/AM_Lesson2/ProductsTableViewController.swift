//
//  ProductsTableViewController.swift
//  AM_Lesson2
//
//  Created by Hector de Jesus Ramirez Landa on 2017-03-27.
//  Copyright © 2017 Hector de Jesus Ramirez Landa. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
    var sortedProducts = [String: [Product]]()
    var products = [Product]()
    var productId: String = ""
    //var selectedIndex = NSIndexPath()
    var selectedProduct = Product()
    
    func loadData() {
        let string = "http://www.bestbuy.ca/api/v2/json/search?categoryid=\(productId)&lang=en"
        AlamofireHelper.alamofireHelper.runRequest(Product.self, urlString: string, objectName: "products", callback: { data in self.reloadData(data) } )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func reloadData(prods: [Product]) {
        products = prods
        for product in products {
            if (sortedProducts[product.categoryName] == nil) {
                sortedProducts[product.categoryName] = [Product]()
                sortedProducts[product.categoryName]!.append(product)
            } else {
                sortedProducts[product.categoryName]!.append(product)
            }
            //print(product.categoryName)
            //sortedProducts[product.categoryName]?.append(product)
        }
//        for tmp in sortedProducts {
//            print(tmp.0)
//        }
//        print(sortedProducts.count)
        //print(sortedProducts.keys[sortedProducts.startIndex.advancedBy(1)])
        //print(sortedProducts[sortedProducts.keys[sortedProducts.startIndex.advancedBy(1)]]!.count)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //print(sortedProducts.count)
        return sortedProducts.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //print(sortedProducts[sortedProducts.keys[sortedProducts.startIndex.advancedBy(section)]]!.count)
        return sortedProducts[sortedProducts.keys[sortedProducts.startIndex.advancedBy(section)]]!.count
    }
    
    override func tableView( tableView : UITableView,  titleForHeaderInSection section: Int)->String {
        //print(sortedProducts.keys[sortedProducts.startIndex.advancedBy(section)])
        return sortedProducts.keys[sortedProducts.startIndex.advancedBy(section)]
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("productCell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = sortedProducts[sortedProducts.keys[sortedProducts.startIndex.advancedBy(indexPath.section)]]![indexPath.row].name
        cell.detailTextLabel?.text = "Product price: \(String(sortedProducts[sortedProducts.keys[sortedProducts.startIndex.advancedBy(indexPath.section)]]![indexPath.row].regularPrice))"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("clicked")
        self.selectedProduct = sortedProducts[sortedProducts.keys[sortedProducts.startIndex.advancedBy(indexPath.section)]]![indexPath.row]
        performSegueWithIdentifier("toProductDetail", sender: nil)
//        let num = Int(categories[indexPath.row].id)
//        if num != nil {
//            print("Valid Integer")
//            selectedProductId = categories[indexPath.row].id
//            performSegueWithIdentifier("toProducts", sender: nil)
//        }
//        else {
//            print("Not Valid Integer")
//            let builtMsg = "Id: \(categories[indexPath.row].id) Name: \(categories[indexPath.row].name) ProductCount: \(categories[indexPath.row].productCount)"
//            let alert = UIAlertController(title: "The selected element id is Invalid!", message: builtMsg, preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toProductDetail") {
            //Checking identifier is crucial as there might be multiple
            // segues attached to same view
            let detailVC = segue.destinationViewController as! ProductDetailViewController;
            detailVC.currentProduct = self.selectedProduct
        }
    }

}
