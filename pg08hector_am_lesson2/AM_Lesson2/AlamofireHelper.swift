//
//  AlamofireHelper.swift
//  AM_Lesson2
//
//  Created by Hector de Jesus Ramirez Landa on 2017-03-20.
//  Copyright © 2017 Hector de Jesus Ramirez Landa. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireHelper {
    static let alamofireHelper = AlamofireHelper()
//    func runRequest(urlString: String, completionHandler: Response<AnyObject, NSError> -> Void) {
//        
//    }
    
    func runRequest<T: GenericObject>(type: T.Type,urlString: String, objectName: String, callback: ([T]) -> Void) -> Void {
        //, completionHandler: Response<AnyObject, NSError> -> Void, completionHandler: (T) -> Void
        var array = [T]()
        Alamofire.request(.GET, urlString).validate().responseJSON(completionHandler: {response in
            //debugPrint(response)
            if let result = response.result.value {
                //print("Json1: \(result)")
                let json = result as! NSDictionary
                //let json = result as! [String:Any]
                let subCategoriesArray = json[objectName] as! NSArray
                //print(subCategoriesArray)
                //let subCategoriesArray = json["subCategories"] as! [String:Any]
                for item in subCategoriesArray {
                    //print(item["productCount"] as! Int)
                    array.append(T.self(item: item as! NSDictionary))
                }
                callback(array);
            }
        })
        //callback(array);
    }
    
//    func runRequest<T>(type: T.Type, urlString: String, objectName: String, callback: ([T]) -> Void) -> Void {
//        //, completionHandler: Response<AnyObject, NSError> -> Void, completionHandler: (T) -> Void
//        var array = [T]()
//        Alamofire.request(.GET, urlString).validate().responseJSON(completionHandler: {response in
//            //debugPrint(response)
//            if let result = response.result.value {
//                //print("Json1: \(result)")
//                let json = result as! NSDictionary
//                //let json = result as! [String:Any]
//                let subCategoriesArray = json[objectName] as! NSArray
//                //print(subCategoriesArray)
//                //let subCategoriesArray = json["subCategories"] as! [String:Any]
//                for item in subCategoriesArray {
//                    //print(item["productCount"] as! Int)
//                    array.append(T as type(item: item as! NSDictionary))
//                }
//                callback(array);
//            }
//        })
//        //callback(array);
//    }
    
}
