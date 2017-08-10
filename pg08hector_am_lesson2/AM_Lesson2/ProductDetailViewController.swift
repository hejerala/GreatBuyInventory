//
//  ProductDetailViewController.swift
//  AM_Lesson2
//
//  Created by Hector de Jesus Ramirez Landa on 2017-03-27.
//  Copyright © 2017 Hector de Jesus Ramirez Landa. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var currentProduct = Product()
    var urlBase: String = "http://www.bestbuy.ca"

    @IBOutlet weak var productNameTxt: UILabel!
    //@IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productImageWebView: UIWebView!
    @IBOutlet weak var productDescriptionTxt: UILabel!
    @IBOutlet weak var productPriceTxt: UILabel!
    
    func loadData() {
        productNameTxt?.text = currentProduct.name
        productDescriptionTxt?.text = currentProduct.description
        productPriceTxt?.text = "$\(currentProduct.regularPrice)"
        
        let url = NSURL (string: currentProduct.thumbnail);
        //print(currentProduct.img)
        let requestObj = NSURLRequest(URL: url!);
        productImageWebView.loadRequest(requestObj);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func checkOnWebPressed(sender: AnyObject) {
        //print(currentProduct.url)
        UIApplication.sharedApplication().openURL(NSURL(string: urlBase+currentProduct.url)!)
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
