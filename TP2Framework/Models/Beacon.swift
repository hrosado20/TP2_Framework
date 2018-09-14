//
//  Beacon.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Beacon {
    var id: Int
    var uuid: String
    var major: Int
    var minor: Int
    var privateId: String
    var batteryLife: String
    var color: String
    var name: String
    var transmitPower: String
    var owner: String
    var latitude: Float
    var longitude: Float
    var altitude: Float
    var status: String
    
    public init() {
        self.id = 0
        self.uuid = ""
        self.major = 0
        self.minor = 0
        self.privateId = ""
        self.batteryLife = ""
        self.color = ""
        self.name = ""
        self.transmitPower = ""
        self.owner = ""
        self.latitude = 0.0000
        self.longitude = 0.0000
        self.altitude = 0.0000
        self.status = ""
    }
    
    public init(id: Int, uuid: String, major: Int, minor: Int, privateId: String, batteryLife: String, color: String, name: String, transmitPower: String, owner: String, latitude: Float, longitude: Float, altitude: Float, status: String) {
        self.id = id
        self.uuid = uuid
        self.major = major
        self.minor = minor
        self.privateId = privateId
        self.batteryLife = batteryLife
        self.color = color
        self.name = name
        self.transmitPower = transmitPower
        self.owner = owner
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  uuid: jsonObject["uuid"].stringValue,
                  major: jsonObject["major"].intValue,
                  minor: jsonObject["minor"].intValue,
                  privateId: jsonObject["privateId"].stringValue,
                  batteryLife: jsonObject["batteryLife"].stringValue,
                  color: jsonObject["color"].stringValue,
                  name: jsonObject["name"].stringValue,
                  transmitPower: jsonObject["transmitPower"].stringValue,
                  owner: jsonObject["owner"].stringValue,
                  latitude: jsonObject["latitude"].floatValue,
                  longitude: jsonObject["longitude"].floatValue,
                  altitude: jsonObject["altitude"].floatValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Beacon] {
        var modelList = [Beacon]()
        for i in 0..<jsonArray.count {
            modelList.append(Beacon.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
