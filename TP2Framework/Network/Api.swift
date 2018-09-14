//
//  Api.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

public class Api {
    private static let url: String = "https://tp2-backend.herokuapp.com"
    
    public static var baseUrl: String {
        return "\(url)/api/v1"
    }
}
