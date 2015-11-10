//
//  StringStyleColorizer.swift
//  StringStyleColorizer
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation



public extension String {
    
    public struct StringStyleColorizer {
        
        let string: String
        
        public var Reset: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Reset).description
            }
        }
        
        public var Bold: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Bold).description
            }
        }
        
        public var Italic: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Italic).description
            }
        }
        
        public var Underline: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Underline).description
            }
        }
        
        public var Inverse: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Inverse).description
            }
        }
        
        public var Strikethrough: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Strikethrough).description
            }
        }
        
        public var BoldOff: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.BoldOff).description
            }
        }
        
        public var ItalicOff: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.ItalicOff).description
            }
        }
        
        public var UnderlineOff: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.UnderlineOff).description
            }
        }
        
        public var InverseOff: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.InverseOff).description
            }
        }
        
        public var StrikethroughOff: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.StrikethroughOff).description
            }
        }
    }
    
}