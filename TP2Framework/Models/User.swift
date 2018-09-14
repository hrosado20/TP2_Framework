//
//  User.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import SwiftyJSON

public class User {
    var id: Int
    var email: String
    var password: String
    var fullName: String
    var lastName: String
    var age: Int
    var dni: String
    var phoneNumber: String
    var profilePicture: String
    var status: String
    
    public init() {
        self.id = 0
        self.email = ""
        self.password = ""
        self.fullName = ""
        self.lastName = ""
        self.age = 0
        self.dni = ""
        self.phoneNumber = ""
        self.profilePicture = ""
        self.status = ""
    }
    
    public init(id: Int, email: String, password: String, fullName: String, lastName: String, age: Int, dni: String, phoneNumber: String?, profilePicture: String?, status: String?) {
        self.id = id
        self.email = email
        self.password = password
        self.fullName = fullName
        self.lastName = lastName
        self.age = age
        self.dni = dni
        self.phoneNumber = (phoneNumber == nil) ? "" : phoneNumber!
        self.profilePicture = (profilePicture == nil) ? "" : profilePicture!
        self.status = (status == nil) ? "" : status!
    }
    
    public convenience init(fromJSONObject jsonObject: JSON) {
        self.init(id: jsonObject["id"].intValue,
                  email: jsonObject["email"].stringValue,
                  password: jsonObject["password"].stringValue,
                  fullName: jsonObject["fullName"].stringValue,
                  lastName: jsonObject["lastName"].stringValue,
                  age: jsonObject["age"].intValue,
                  dni: jsonObject["dni"].stringValue,
                  phoneNumber: jsonObject["phoneNumber"].stringValue,
                  profilePicture: jsonObject["profilePicture"].stringValue,
                  status: jsonObject["status"].stringValue)
    }
    
    public static func buildCollection(fromJSONArray jsonArray: [JSON]) -> [User] {
        var modelList = [User]()
        for i in 0..<jsonArray.count {
            modelList.append(User.init(fromJSONObject: jsonArray[i]))
        }
        return modelList
    }
}
