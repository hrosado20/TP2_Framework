//
//  Preference.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

public class Preferences {
    private static let preferences: UserDefaults = UserDefaults.standard
    
    public static func saveData(key: String, value: String) {
        preferences.set(value, forKey: key)
        
        let didSave = preferences.synchronize()
        
        if !didSave {
            print("Error saving \(value) in UserDefaults")
        }
    }
    
    public static func retreiveData(key: String) -> String {
        guard let value: String = preferences.string(forKey: key) else {
            return ""
        }
        return value
    }
    
    public static func retreiveData(key: String) -> Int {
        var value: Int = 0
        
        value = preferences.integer(forKey: key)
        
        return value
    }
}
