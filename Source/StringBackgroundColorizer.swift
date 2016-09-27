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
        
        public var Black: String {
            return Colorizer(string: string, color: BackgroundColor.black).description
        }
        
        public var Red: String {
            return Colorizer(string: string, color: BackgroundColor.red).description
        }
        
        public var Green: String {
            return Colorizer(string: string, color: BackgroundColor.green).description
        }
        
        public var Yellow: String {
            return Colorizer(string: string, color: BackgroundColor.yellow).description
        }
        
        public var Blue: String {
            return Colorizer(string: string, color: BackgroundColor.blue).description
        }
        
        public var Magenta: String {
            return Colorizer(string: string, color: BackgroundColor.magenta).description
        }
        
        public var Cyan: String {
            return Colorizer(string: string, color: BackgroundColor.cyan).description
        }
        
        public var White: String {
            return Colorizer(string: string, color: BackgroundColor.white).description
        }
    }
}
