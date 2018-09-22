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
    public var id: Int
    public var user: User
    public var promotion: Promotion
    public var inputMessage: String
    public var inputCorrectionlevel: String
    public var url: String
    public var ip: String
    public var createdAt: Date
    public var status: String
    
    public init() {
        self.id = 0
        self.user = User.init()
        self.promotion = Promotion.init()
        self.inputMessage = ""
        self.inputCorrectionlevel = ""
        self.url = ""
        self.ip = ""
        self.createdAt = Utils.getTimeNow()
        self.status = ""
    }
    
    public init(id: Int, user: User, promotion: Promotion, inputMessage: String?, inputCorrectionlevel: String?, url: String?, ip: String?, createdAt: Date, status: String?) {
        self.id = id
        self.user = user
        self.promotion = promotion
        self.inputMessage = (inputMessage == nil) ? "" : inputMessage!
        self.inputCorrectionlevel = (inputCorrectionlevel == nil) ? "" : inputCorrectionlevel!
        self.url = (url == nil) ? "" : url!
        self.ip = (ip == nil) ? "" : ip!
        self.createdAt = createdAt
        self.status = (status == nil) ? "" : status!
    }
    
    public init(id: Int, user: User, promotion: Promotion, inputMessage: String?, inputCorrectionlevel: String?, url: String?, ip: String?, createdAt: String, status: String?) {
        self.id = id
        self.user = user
        self.promotion = promotion
        self.inputMessage = (inputMessage == nil) ? "" : inputMessage!
        self.inputCorrectionlevel = (inputCorrectionlevel == nil) ? "" : inputCorrectionlevel!
        self.url = (url == nil) ? "" : url!
        self.ip = (ip == nil) ? "" : ip!
        self.createdAt = Utils.convertDate(from: createdAt)
        self.status = (status == nil) ? "" : status!
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  user: User.init(fromJSONObject: jsonObject["user"]),
                  promotion: Promotion.init(fromJSONObject: jsonObject["promotion"]),
                  inputMessage: jsonObject["inputMessage"].stringValue,
                  inputCorrectionlevel: jsonObject["inputCorrectionLevel"].stringValue,
                  url: jsonObject["url"].stringValue,
                  ip: jsonObject["ip"].stringValue,
                  createdAt: jsonObject["createdAt"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [QRCode] {
        var modelList = [QRCode]()
        for i in 0..<jsonArray.count {
            modelList.append(QRCode.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
