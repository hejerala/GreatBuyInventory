//
//  DepartmentsTableViewController.swift
//  AM_Lesson2
//
//  Created by Hector de Jesus Ramirez Landa on 2017-03-13.
//  Copyright © 2017 Hector de Jesus Ramirez Landa. All rights reserved.
//

import UIKit
import Alamofire

//class Department {
//    var id:String
//    var name:String
//    var productCount:Int
//    
//    init(id: String, name:String, productCount:Int) {
//        self.id = id
//        self.name = name
//        self.productCount = productCount
//    }
//}

class DepartmentsTableViewController: UITableViewController {
    
    var departments = [Department]()
    var selectedCategoryId: String = ""
    
    func loadData() {
        let string = "http://www.bestbuy.ca/api/v2/json/category/departments?lang=en&format=json"
        //let urlString = NSURL(string: string)
        //let urlRequest = NSMutableURLRequest(URL: urlString!)
        
        //array.sort({ [unowned self] (item1: Int, item2: Int) -> Bool in return item1 < item2 })
        
        //AlamofireHelper.alamofireHelper.runRequest(Department.self, urlString: string, objectName: "subCategories", callback: { data in self.reloadData(data as! [Department]) } )
        
        AlamofireHelper.alamofireHelper.runRequest(Department.self, urlString: string, objectName: "subCategories", callback: { data in self.reloadData(data) } )
        
        //AlamofireHelper.alamofireHelper.runRequest<Department>(string, objectName: "subCategories", callback: { data in self.reloadData(data) } )
        
        
//        Alamofire.request(.GET, string).validate().responseJSON(completionHandler: {response in
//            //debugPrint(response)
//            if let result = response.result.value {
//                //print("Json1: \(result)")
//                let json = result as! NSDictionary
//                //let json = result as! [String:Any]
//                let subCategoriesArray = json["subCategories"] as! NSArray
//                //print(subCategoriesArray)
//                //let subCategoriesArray = json["subCategories"] as! [String:Any]
//                for item in subCategoriesArray {
//                    //print(item["productCount"] as! Int)
//                    self.departments.append(Department(id: item["id"] as! String, name: item["name"] as! String, productCount: item["productCount"] as! Int))
//                }
//            }
//            self.tableView.reloadData()
//        })
        
        
//        Alamofire.request(urlRequest).validate().responseJSON { response in
//            debugPrint(response)
//            if let json = response.result.value {
//                print("Json2: \(json)")
//            }
//        }
    }
    
    func reloadData(deps: [Department]) {
        departments = deps
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return departments.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("departmentCell", forIndexPath: indexPath)

        // Configure the cell...
        cell.textLabel?.text = departments[indexPath.row].name
        cell.detailTextLabel?.text = "Product count: \(String(departments[indexPath.row].productCount))"

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let num = Int(departments[indexPath.row].id)
        if num != nil {
            //print("Valid Integer")
            selectedCategoryId = departments[indexPath.row].id
            performSegueWithIdentifier("toCategories", sender: nil)
        }
        else {
            //print("Not Valid Integer")
            let builtMsg = "Id: \(departments[indexPath.row].id) Name: \(departments[indexPath.row].name) ProductCount: \(departments[indexPath.row].productCount)"
            let alert = UIAlertController(title: "The selected element id is Invalid!", message: builtMsg, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
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
        if (segue.identifier == "toCategories") {
            //Checking identifier is crucial as there might be multiple
            // segues attached to same view
            let detailVC = segue.destinationViewController as! CategoriesTableViewController;
            detailVC.categoryId = self.selectedCategoryId
        }
    }
    
}
