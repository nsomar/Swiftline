//
//  StringForegroundColorizer.swift
//  StringForegroundColorizer
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


extension String {
    
    public struct StringForegroundColorizer {
        
        let string: String
        
        public var Black: String {
            return Colorizer(string: string, color: ForegroundColor.black).description
        }
        
        public var Red: String {
            return Colorizer(string: string, color: ForegroundColor.red).description
        }
        
        public var Green: String {
            return Colorizer(string: string, color: ForegroundColor.green).description
        }
        
        public var Yellow: String {
            return Colorizer(string: string, color: ForegroundColor.yellow).description
        }
        
        public var Blue: String {
            return Colorizer(string: string, color: ForegroundColor.blue).description
        }
        
        public var Magenta: String {
            return Colorizer(string: string, color: ForegroundColor.magenta).description
        }
        
        public var Cyan: String {
            return Colorizer(string: string, color: ForegroundColor.cyan).description
        }
        
        public var White: String {
            return Colorizer(string: string, color: ForegroundColor.white).description
        }
    }
    
}
