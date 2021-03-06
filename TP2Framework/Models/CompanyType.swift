//
//  CompanyType.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class CompanyType {
    public var id: Int
    public var name: String
    public var status: String
    
    public init() {
        self.id = 0
        self.name = ""
        self.status = ""
    }
    
    public init(id: Int, name: String, status: String) {
        self.id = id
        self.name = name
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  name: jsonObject["name"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [CompanyType] {
        var modelList = [CompanyType]()
        for i in 0..<jsonArray.count {
            modelList.append(CompanyType.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
