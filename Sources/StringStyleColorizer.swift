//
//  StringStyleColorizer.swift
//  StringStyleColorizer
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


public extension String {
    
    public struct StringStyleColorizer {
        
        let string: String
        
        public var reset: String {
            return Colorizer(string: string, color: StringTextStyle.reset).description
        }
        
        public var bold: String {
            return Colorizer(string: string, color: StringTextStyle.bold).description
        }
        
        public var italic: String {
            return Colorizer(string: string, color: StringTextStyle.italic).description
        }
        
        public var underline: String {
            return Colorizer(string: string, color: StringTextStyle.underline).description
        }
        
        public var inverse: String {
            return Colorizer(string: string, color: StringTextStyle.inverse).description
        }
        
        public var strikethrough: String {
            return Colorizer(string: string, color: StringTextStyle.strikethrough).description
        }
        
        public var boldOff: String {
            return Colorizer(string: string, color: StringTextStyle.boldOff).description
        }
        
        public var italicOff: String {
            return Colorizer(string: string, color: StringTextStyle.italicOff).description
        }
        
        public var underlineOff: String {
            return Colorizer(string: string, color: StringTextStyle.underlineOff).description
        }
        
        public var inverseOff: String {
            return Colorizer(string: string, color: StringTextStyle.inverseOff).description
        }
        
        public var strikethroughOff: String {
            return Colorizer(string: string, color: StringTextStyle.strikethroughOff).description
        }
    }
    
}
