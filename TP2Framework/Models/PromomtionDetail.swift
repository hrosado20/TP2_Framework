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
    public var id: Int
    public var promotion: Promotion
    public var product: Product
    public var quantity: Int
    public var createdAt: Date
    public var status: String
    
    public init() {
        self.id = 0
        self.promotion = Promotion.init()
        self.product = Product.init()
        self.quantity = 0
        self.createdAt = Utils.getTimeNow()
        self.status = ""
    }
    
    public init(id: Int, promotion: Promotion, product: Product, quantity: Int, createdAt: Date, status: String) {
        self.id = id
        self.promotion = promotion
        self.product = product
        self.quantity = quantity
        self.createdAt = createdAt
        self.status = status
    }
    
    public init(id: Int, promotion: Promotion, product: Product, quantity: Int, createdAt: String, status: String) {
        self.id = id
        self.promotion = promotion
        self.product = product
        self.quantity = quantity
        self.createdAt = Utils.convertDate(from: createdAt)
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  promotion: Promotion.init(fromJSONObject: jsonObject["promotion"]),
                  product: Product.init(fromJSONObject: jsonObject["product"]),
                  quantity: jsonObject["quantity"].intValue,
                  createdAt: jsonObject["createdAt"].stringValue,
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
