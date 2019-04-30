//
//  StringStyleColorizer.swift
//  StringStyleColorizer
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


public extension String {
    
    struct StringStyleColorizer {
        
        let string: String
        
        public var Reset: String {
            return Colorizer(string: string, color: StringTextStyle.reset).description
        }
        
        public var Bold: String {
            return Colorizer(string: string, color: StringTextStyle.bold).description
        }
        
        public var Italic: String {
            return Colorizer(string: string, color: StringTextStyle.italic).description
        }
        
        public var Underline: String {
            return Colorizer(string: string, color: StringTextStyle.underline).description
        }
        
        public var Inverse: String {
            return Colorizer(string: string, color: StringTextStyle.inverse).description
        }
        
        public var Strikethrough: String {
            return Colorizer(string: string, color: StringTextStyle.strikethrough).description
        }
        
        public var BoldOff: String {
            return Colorizer(string: string, color: StringTextStyle.boldOff).description
        }
        
        public var ItalicOff: String {
            return Colorizer(string: string, color: StringTextStyle.italicOff).description
        }
        
        public var UnderlineOff: String {
            return Colorizer(string: string, color: StringTextStyle.underlineOff).description
        }
        
        public var InverseOff: String {
            return Colorizer(string: string, color: StringTextStyle.inverseOff).description
        }
        
        public var StrikethroughOff: String {
            return Colorizer(string: string, color: StringTextStyle.strikethroughOff).description
        }
    }
    
}
