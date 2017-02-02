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
        
        public var black: String {
            return Colorizer(string: string, color: ForegroundColor.black).description
        }
        
        public var red: String {
            return Colorizer(string: string, color: ForegroundColor.red).description
        }
        
        public var green: String {
            return Colorizer(string: string, color: ForegroundColor.green).description
        }
        
        public var yellow: String {
            return Colorizer(string: string, color: ForegroundColor.yellow).description
        }
        
        public var blue: String {
            return Colorizer(string: string, color: ForegroundColor.blue).description
        }
        
        public var magenta: String {
            return Colorizer(string: string, color: ForegroundColor.magenta).description
        }
        
        public var cyan: String {
            return Colorizer(string: string, color: ForegroundColor.cyan).description
        }
        
        public var white: String {
            return Colorizer(string: string, color: ForegroundColor.white).description
        }
    }
    
}
