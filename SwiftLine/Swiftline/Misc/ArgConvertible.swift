//
//  ArgConvertible.swift
//  ArgConvertible
//
//  Created by Omar Abdelhafith on 02/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


/**
 *  Any type that extends ArgConvertibleType can be used in ask and choose
 */
public protocol ArgConvertibleType {
    
    /// Create an instance out of a string
    static func fromString(string: String) -> Self?
    
    /// Return the display name of a type
    static func typeName() -> String
}


extension Int: ArgConvertibleType {
    public static func fromString(string: String) -> Int? {
        return Int(string)
    }
    
    public static func typeName() -> String {
        return "Integer"
    }
}


extension Double: ArgConvertibleType {
    public static func fromString(string: String) -> Double? {
        return Double(string)
    }
    
    public static func typeName() -> String {
        return "Double"
    }
}

extension Float: ArgConvertibleType {
    public static func fromString(string: String) -> Float? {
        return Float(string)
    }
    
    public static func typeName() -> String {
        return "Float"
    }
}


extension String: ArgConvertibleType {
    public static func fromString(string: String) -> String? {
        return string
    }
    
    public static func typeName() -> String {
        return "String"
    }
}
