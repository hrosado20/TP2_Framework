//
//  Product.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Product {
    var id: Int
    var name: String
    var description: String
    var price: Float
    var image: String
    var status: String
    
    public init() {
        self.id = 0
        self.name = ""
        self.description = ""
        self.price = 0.0000
        self.image = ""
        self.status = ""
    }
    
    public init(id: Int, name: String, description: String, price: Float, image: String, status: String) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.image = image
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  name: jsonObject["name"].stringValue,
                  description: jsonObject["description"].stringValue,
                  price: jsonObject["price"].floatValue,
                  image: jsonObject["image"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Product] {
        var modelList = [Product]()
        for i in 0..<jsonArray.count {
            modelList.append(Product.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
