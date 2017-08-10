//
//  Product.swift
//  AM_Lesson2
//
//  Created by Hector de Jesus Ramirez Landa on 2017-03-27.
//  Copyright © 2017 Hector de Jesus Ramirez Landa. All rights reserved.
//

import UIKit

class Product: GenericObject {
    var sku:String
    var categoryName:String
    var name:String
    var description:String
    var regularPrice:Float
    var salePrice:Float
    var img:String
    var thumbnail:String
    var url:String
    //var productCount:Int
    
    private let skuTag: String = "sku"
    private let categoryNameTag: String = "categoryName"
    private let nameTag: String = "name"
    private let descriptionTag: String = "shortDescription"
    private let regularPriceTag: String = "regularPrice"
    private let salePriceTag: String = "salePrice"
    private let imgTag: String = "highResImage"
    private let thumbnailTag: String = "thumbnailImage"
    private let urlTag: String = "productUrl"
    //private let productCountTag: String = "productCount"
    
    required init() {
        self.sku = ""
        self.categoryName = ""
        self.name = ""
        self.description = ""
        self.regularPrice = 0.0
        self.salePrice = 0.0
        self.img = ""
        self.thumbnail = ""
        self.url = ""
        //self.productCount = item[productCountTag] as! Int
        super.init();
    }
    
    required init(item: NSDictionary) {
        self.sku = item[skuTag] as! String
        self.categoryName = item[categoryNameTag] as! String
        self.name = item[nameTag] as! String
        self.description = item[descriptionTag] as! String
        self.regularPrice = item[regularPriceTag] as! Float
        self.salePrice = item[salePriceTag] as! Float
        self.img = item[imgTag] as! String
        self.thumbnail = item[thumbnailTag] as! String
        self.url = item[urlTag] as! String
        //self.productCount = item[productCountTag] as! Int
        super.init(item: item);
    }
    
}

