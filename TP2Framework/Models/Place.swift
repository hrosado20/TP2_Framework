//
//  Place.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Place {
    var id: Int
    var placeType: PlaceType
    var company: Company
    var beacon: Beacon
    var name: String
    var description: String
    var priority: Int
    var latitude: Float
    var longitude: Float
    var altitude: Float
    var status: String
    
    public init() {
        self.id = 0
        self.placeType = PlaceType.init()
        self.company = Company.init()
        self.beacon = Beacon.init()
        self.name = ""
        self.description = ""
        self.priority = 0
        self.latitude = 0.0000
        self.longitude = 0.0000
        self.altitude = 0.0000
        self.status = ""
    }
    
    public init(id: Int, placeType: PlaceType, company: Company, beacon: Beacon, name: String, description: String, priority: Int, latitude: Float, longitude: Float, altitude: Float, status: String) {
        self.id = id
        self.placeType = placeType
        self.company = company
        self.beacon = beacon
        self.name = name
        self.description = description
        self.priority = priority
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.status = status
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  placeType: PlaceType.init(fromJSONObject: jsonObject["placeType"]),
                  company: Company.init(fromJSONObject: jsonObject["company"]),
                  beacon: Beacon.init(fromJSONObject: jsonObject["beacon"]),
                  name: jsonObject["name"].stringValue,
                  description: jsonObject["description"].stringValue,
                  priority: jsonObject["priority"].intValue,
                  latitude: jsonObject["latitude"].floatValue,
                  longitude: jsonObject["longitude"].floatValue,
                  altitude: jsonObject["altitude"].floatValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [Place] {
        var modelList = [Place]()
        for i in 0..<jsonArray.count {
            modelList.append(Place.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
