//
//  Promotion.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Promotion {
    public var id: Int
    public var promotionType: PromotionType
    public var privateId: String
    public var name: String
    public var description: String
    public var initialDate: Date
    public var duration: Int
    public var image: String
    public var totalPrice: Float
    public var createdAt: Date
    public var status: String
    
    public init() {
        self.id = 0
        self.promotionType = PromotionType.init()
        self.privateId = ""
        self.name = ""
        self.description = ""
        self.initialDate = Utils.getTimeNow()
        self.duration = 0
        self.image = ""
        self.totalPrice = 0.0000
        self.createdAt = Utils.getTimeNow()
        self.status = ""
    }
    
    public init(id: Int, promotionType: PromotionType, privateId: String, name: String, description: String, initialDate: Date, duration: Int, image: String?, totalPrice: Float?, createdAt: Date, status: String?) {
        self.id = id
        self.promotionType = promotionType
        self.privateId = privateId
        self.name = name
        self.description = description
        self.initialDate = initialDate
        self.duration = duration
        self.image = (image == nil) ? "" : image!
        self.totalPrice = (totalPrice == nil) ? 0.0000 : totalPrice!
        self.createdAt = createdAt
        self.status = (status == nil) ? "" : status!
    }
    
    public init(id: Int, promotionType: PromotionType, privateId: String, name: String, description: String, initialDate: String, duration: Int, image: String?, totalPrice: Float?, createdAt: String, status: String?) {
        self.id = id
        self.promotionType = promotionType
        self.privateId = privateId
        self.name = name
        self.description = description
        self.initialDate = Utils.convertDate(from: initialDate)
        self.duration = duration
        self.image = (image == nil) ? "" : image!
        self.totalPrice = (totalPrice == nil) ? 0.0000 : totalPrice!
        self.createdAt = Utils.convertDate(from: createdAt)
        self.status = (status == nil) ? "" : status!
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  promotionType: PromotionType.init(fromJSONObject: jsonObject["promotionType"]),
                  privateId: jsonObject["privateId"].stringValue,
                  name: jsonObject["name"].stringValue,
                  description: jsonObject["description"].stringValue,
                  initialDate: jsonObject["initialDate"].stringValue,
                  duration: jsonObject["duration"].intValue,
                  image: jsonObject["image"].stringValue,
                  totalPrice: jsonObject["totalPrice"].floatValue,
                  createdAt: jsonObject["createdAt"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Promotion] {
        var modelList = [Promotion]()
        for i in 0..<jsonArray.count {
            modelList.append(Promotion.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
