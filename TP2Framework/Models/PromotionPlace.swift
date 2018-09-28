//
//  PromotionPlace.swift
//  TP2Framework
//
//  Created by Hugo Andres on 28/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PromotionPlace {
    public var id: Int
    public var place: Place
    public var promotion: Promotion
    public var status: String
    
    public init() {
        self.id = 0
        self.place = Place.init()
        self.promotion = Promotion.init()
        self.status = ""
    }
    
    public init(id: Int, place: Place, promotion: Promotion, status: String) {
        self.id = id
        self.place = place
        self.promotion = promotion
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  place: Place.init(fromJSONObject: jsonObject["place"]),
                  promotion: Promotion.init(fromJSONObject: jsonObject["promotion"]),
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [PromotionPlace] {
        var modelList = [PromotionPlace]()
        for i in 0..<jsonArray.count {
            modelList.append(PromotionPlace.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
