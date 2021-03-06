//
//  Company.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Company {
    public var id: Int
    public var companyType: CompanyType
    public var name: String
    public var ruc: String
    public var address: String
    public var status: String
    
    public init() {
        self.id = 0
        self.companyType = CompanyType.init()
        self.name = ""
        self.ruc = ""
        self.address = ""
        self.status = ""
    }
    
    public init(id: Int, companyType: CompanyType, name: String, ruc: String, address: String?, status: String?) {
        self.id = id
        self.companyType = companyType
        self.name = name
        self.ruc = ruc
        self.address = (address == nil) ? "" : address!
        self.status = (status == nil) ? "" : status!
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  companyType: CompanyType.init(fromJSONObject: jsonObject["companyType"]),
                  name: jsonObject["name"].stringValue,
                  ruc: jsonObject["ruc"].stringValue,
                  address: jsonObject["address"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Company] {
        var modelList = [Company]()
        for i in 0..<jsonArray.count {
            modelList.append(Company.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
