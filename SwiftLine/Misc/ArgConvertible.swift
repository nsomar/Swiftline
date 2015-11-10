//
//  ArgConvertible.swift
//  ArgConvertible
//
//  Created by Omar Abdelhafith on 02/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


protocol ArgConvertibleType {
    static func fromString(string: String) -> Self?
    static func typeName() -> String
}


extension Int: ArgConvertibleType {
    static func fromString(string: String) -> Int? {
        return Int(string)
    }
    
    static func typeName() -> String {
        return "Integer"
    }
}


extension Double: ArgConvertibleType {
    static func fromString(string: String) -> Double? {
        return Double(string)
    }
    
    static func typeName() -> String {
        return "Double"
    }
}


extension String: ArgConvertibleType {
    static func fromString(string: String) -> String? {
        return string
    }
    
    static func typeName() -> String {
        return "String"
    }
}
