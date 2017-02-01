//
//  StringBackgroundColorizer.swift
//  StringBackgroundColorizer
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


extension String {
    
    public struct StringBackgroundColorizer {
        
        let string: String
        
        public var black: String {
            return Colorizer(string: string, color: BackgroundColor.black).description
        }
        
        public var red: String {
            return Colorizer(string: string, color: BackgroundColor.red).description
        }
        
        public var green: String {
            return Colorizer(string: string, color: BackgroundColor.green).description
        }
        
        public var yellow: String {
            return Colorizer(string: string, color: BackgroundColor.yellow).description
        }
        
        public var blue: String {
            return Colorizer(string: string, color: BackgroundColor.blue).description
        }
        
        public var magenta: String {
            return Colorizer(string: string, color: BackgroundColor.magenta).description
        }
        
        public var cyan: String {
            return Colorizer(string: string, color: BackgroundColor.cyan).description
        }
        
        public var white: String {
            return Colorizer(string: string, color: BackgroundColor.white).description
        }
    }
}
