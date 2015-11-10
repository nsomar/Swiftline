//
//  StringStyleColorizer.swift
//  StringStyleColorizer
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


extension String {
    
    struct StringStyleColorizer {
        
        let string: String
        
        var Reset: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Reset).description
            }
        }
        
        var Bold: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Bold).description
            }
        }
        
        var Italic: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Italic).description
            }
        }
        
        var Underline: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Underline).description
            }
        }
        
        var Inverse: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Inverse).description
            }
        }
        
        var Strikethrough: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.Strikethrough).description
            }
        }
        
        var BoldOff: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.BoldOff).description
            }
        }
        
        var ItalicOff: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.ItalicOff).description
            }
        }
        
        var UnderlineOff: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.UnderlineOff).description
            }
        }
        
        var InverseOff: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.InverseOff).description
            }
        }
        
        var StrikethroughOff: String {
            get {
                return Colorizer(string: string, color: StringTextStyle.StrikethroughOff).description
            }
        }
    }
    
}