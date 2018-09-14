//
//  Utils.swift
//  TP2Framework
//
//  Created by Hugo Andres on 7/09/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

public class Utils {
    // MARK: Dateformatter
    private static var dateFormatter: DateFormatter = DateFormatter()
    
    public static func convertDate(from now: Date?) -> String {
        self.dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        self.dateFormatter.timeStyle = .medium
        self.dateFormatter.dateStyle = .long
        
        return (now == nil) ? dateFormatter.string(for: Date())! : dateFormatter.string(for: now)!
    }
    
    public static func convertDate(from now: String?) -> Date {
        self.dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        self.dateFormatter.timeStyle = .medium
        self.dateFormatter.dateStyle = .long
        
        return (now == nil) ? Date() : dateFormatter.date(from: now!)!
    }
    
    public static func getTimeNow() -> String {
        self.dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        self.dateFormatter.timeStyle = .medium
        self.dateFormatter.dateStyle = .long
        
        return dateFormatter.string(from: Date())
    }
    
    public static func getTimeNow() -> Date {
        return Date()
    }
    
    public static func addIconToTextField(textField: UITextField, icon: UIImage, widthMargin: CGFloat, heightMargin: CGFloat, padding: Int) {
        let iconWidth: CGFloat = icon.size.width - CGFloat(padding)
        let iconHeight: CGFloat = icon.size.height - CGFloat(padding)
        
        let leftImageView = UIImageView(frame: CGRect(x: widthMargin, y: heightMargin, width: iconWidth, height: iconHeight))
        leftImageView.image = icon
        let view = UIView(frame: CGRect(x: 0, y: 0, width: iconWidth + widthMargin, height: iconHeight + heightMargin))
        view.addSubview(leftImageView)
        textField.leftView = view
        textField.leftViewMode = .always
    }
}
