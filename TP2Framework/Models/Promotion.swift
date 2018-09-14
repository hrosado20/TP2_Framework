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
    var id: Int
    var promotionType: PromotionType
    var name: String
    var description: String
    var initialDate: Date
    var duration: Int
    var totalPrice: Float
    var status: String
    
    public init() {
        self.id = 0
        self.promotionType = PromotionType.init()
        self.name = ""
        self.description = ""
        self.initialDate = Utils.getTimeNow()
        self.duration = 0
        self.totalPrice = 0.0000
        self.status = ""
    }
    
    public init(id: Int, promotionType: PromotionType, name: String, description: String, initialDate: Date, duration: Int, totalPrice: Float?, status: String?) {
        self.id = id
        self.promotionType = promotionType
        self.name = name
        self.description = description
        self.initialDate = initialDate
        self.duration = duration
        self.totalPrice = (totalPrice == nil) ? 0.0000 : totalPrice!
        self.status = (status == nil) ? "" : status!
    }
    
    public init(id: Int, promotionType: PromotionType, name: String, description: String, initialDate: String, duration: Int, totalPrice: Float?, status: String?) {
        self.id = id
        self.promotionType = promotionType
        self.name = name
        self.description = description
        self.initialDate = Utils.convertDate(from: initialDate)
        self.duration = duration
        self.totalPrice = (totalPrice == nil) ? 0.0000 : totalPrice!
        self.status = (status == nil) ? "" : status!
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  promotionType: PromotionType.init(fromJSONObject: jsonObject["promotionType"]),
                  name: jsonObject["name"].stringValue,
                  description: jsonObject["description"].stringValue,
                  initialDate: jsonObject["initialDate"].stringValue,
                  duration: jsonObject["duration"].intValue,
                  totalPrice: jsonObject["totalPrice"].floatValue,
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
