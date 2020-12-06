//
//  StringExtension.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 06/12/2020.
//  Copyright © 2020 Hassan dad khan. All rights reserved.
//

import Foundation
extension String {
    
    var isBlank: Bool {

        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    func toBool() -> Bool? {
        switch self.lowercased() {
        case "true", "yes", "1":
            return true
        case "false", "no", "0":
            return false
        default:
            return nil
        }
    }
    
    func toFloat() -> Float? {
        return (self as NSString).floatValue
    }
    
    func toInt64() -> Int64? {
        return Int64(self)
    }
    
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
    
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
}
