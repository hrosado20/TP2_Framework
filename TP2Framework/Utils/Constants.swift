//
//  Constants.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

public class Constants {
    public struct cloudinary {
        public static var userPreset = "user_preset"
        public static var promotionPreset = "promotion_preset"
        public static var productPreset = "product_preset"
    }
    public struct keys {
        public static var token: String = "token"
        public static var refreshToken: String = "refreshToken"
        public static var beaconId: String = "beaconId"
        public static var companyId: String = "companyId"
        public static var companyTypeId: String = "companyTypeId"
        public static var placeId: String = "placeId"
        public static var placeTypeId: String = "placeTypeId"
        public static var productId: String = "productId"
        public static var promotionId: String = "promotionId"
        public static var promotionDetailId: String = "promotionDetailId"
        public static var promotionTypeId: String = "promotionTypeId"
        public static var QRCodeId: String = "QRCodeId"
        public static var userId: String = "userId"
    }
    public static var header: String = "header"
    public static var accept: String = "application/json"
}
