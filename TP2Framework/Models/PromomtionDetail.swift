//
//  PromomtionDetail.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PromotionDetail {
    var id: Int
    var promotion: Promotion
    var product: Product
    var quantity: Int
    var status: String
    
    public init() {
        self.id = 0
        self.promotion = Promotion.init()
        self.product = Product.init()
        self.quantity = 0
        self.status = ""
    }
    
    public init(id: Int, promotion: Promotion, product: Product, quantity: Int, status: String) {
        self.id = id
        self.promotion = promotion
        self.product = product
        self.quantity = quantity
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  promotion: Promotion.init(fromJSONObject: jsonObject["promotion"]),
                  product: Product.init(fromJSONObject: jsonObject["product"]),
                  quantity: jsonObject["quantity"].intValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [PromotionDetail] {
        var modelList = [PromotionDetail]()
        for i in 0..<jsonArray.count {
            modelList.append(PromotionDetail.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
