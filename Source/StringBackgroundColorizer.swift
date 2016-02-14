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
            return Colorizer(string: string, color: BackgroundColor.Black).description
        }
        
        public var Red: String {
            return Colorizer(string: string, color: BackgroundColor.Red).description
        }
        
        public var Green: String {
            return Colorizer(string: string, color: BackgroundColor.Green).description
        }
        
        public var Yellow: String {
            return Colorizer(string: string, color: BackgroundColor.Yellow).description
        }
        
        public var Blue: String {
            return Colorizer(string: string, color: BackgroundColor.Blue).description
        }
        
        public var Magenta: String {
            return Colorizer(string: string, color: BackgroundColor.Magenta).description
        }
        
        public var Cyan: String {
            return Colorizer(string: string, color: BackgroundColor.Cyan).description
        }
        
        public var White: String {
            return Colorizer(string: string, color: BackgroundColor.White).description
        }
    }
}