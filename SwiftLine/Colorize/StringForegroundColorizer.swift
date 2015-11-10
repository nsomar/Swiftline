//
//  StringForegroundColorizer.swift
//  StringForegroundColorizer
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


extension String {
    
    struct StringForegroundColorizer {
        
        let string: String
        
        var Black: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Black).description
            }
        }
        
        var Red: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Red).description
            }
        }
        
        var Green: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Green).description
            }
        }
        
        var Yellow: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Yellow).description
            }
        }
        
        var Blue: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Blue).description
            }
        }
        
        var Magenta: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Magenta).description
            }
        }
        
        var Cyan: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.Cyan).description
            }
        }
        
        var White: String {
            get {
                return Colorizer(string: string, color: ForegroundColor.White).description
            }
        }
    }

}