//
//  StringForegroundColorizer.swift
//  StringForegroundColorizer
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


extension String {
    
    public struct StringForegroundColorizer {
        
        let string: String
        
        public var Black: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Black).description
            }
        }
        
        public var Red: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Red).description
            }
        }
        
        public var Green: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Green).description
            }
        }
        
        public var Yellow: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Yellow).description
            }
        }
        
        public var Blue: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Blue).description
            }
        }
        
        public var Magenta: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Magenta).description
            }
        }
        
        public var Cyan: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Cyan).description
            }
        }
        
        public var White: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.White).description
            }
        }
    }

}