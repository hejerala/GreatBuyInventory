//
//  Department.swift
//  AM_Lesson2
//
//  Created by Hector de Jesus Ramirez Landa on 2017-03-20.
//  Copyright © 2017 Hector de Jesus Ramirez Landa. All rights reserved.
//

import UIKit

class Department: GenericObject {
    var id:String
    var name:String
    var productCount:Int
    
    private let idTag: String = "id"
    private let nameTag: String = "name"
    private let productCountTag: String = "productCount"
    
//    init(id: String, name:String, productCount:Int) {
//        self.id = id
//        self.name = name
//        self.productCount = productCount
//    }
    
    required init() {
        self.id = ""
        self.name = ""
        self.productCount = 0
        super.init();
    }
    
    required init(item: NSDictionary) {
        self.id = item[idTag] as! String
        self.name = item[nameTag] as! String
        self.productCount = item[productCountTag] as! Int
        super.init(item: item);
    }
    
}
