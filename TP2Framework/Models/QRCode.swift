//
//  QRCode.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class QRCode {
    var id: Int
    var user: User
    var promotion: Promotion
    var inputMessage: String
    var inputCorrectionlevel: String
    var url: String
    var ip: String
    var status: String
    
    public init() {
        self.id = 0
        self.user = User.init()
        self.promotion = Promotion.init()
        self.inputMessage = ""
        self.inputCorrectionlevel = ""
        self.url = ""
        self.ip = ""
        self.status = ""
    }
    
    public init(id: Int, user: User, promotion: Promotion, inputMessage: String, inputCorrectionlevel: String, url: String, ip: String, status: String) {
        self.id = id
        self.user = user
        self.promotion = promotion
        self.inputMessage = inputMessage
        self.inputCorrectionlevel = inputCorrectionlevel
        self.url = url
        self.ip = ip
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  user: User.init(fromJSONObject: jsonObject["user"]),
                  promotion: Promotion.init(fromJSONObject: jsonObject["promotion"]),
                  inputMessage: jsonObject["inputMessage"].stringValue,
                  inputCorrectionlevel: jsonObject["inputCorrectionLevel"].stringValue,
                  url: jsonObject["url"].stringValue,
                  ip: jsonObject["ip"].stringValue,
                  status: jsonObject[""].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [QRCode] {
        var modelList = [QRCode]()
        for i in 0..<jsonArray.count {
            modelList.append(QRCode.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
