//
//  StringBackgroundColorizer.swift
//  StringBackgroundColorizer
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


extension String {
    
    struct StringBackgroundColorizer {
        
        let string: String
        
        var Black: String {
            get {
                return Colorizer(string: string, color: BackgroundColor.Black).description
            }
        }
        
        var Red: String {
            get {
                return Colorizer(string: string, color: BackgroundColor.Red).description
            }
        }
        
        var Green: String {
            get {
                return Colorizer(string: string, color: BackgroundColor.Green).description
            }
        }
        
        var Yellow: String {
            get {
                return Colorizer(string: string, color: BackgroundColor.Yellow).description
            }
        }
        
        var Blue: String {
            get {
                return Colorizer(string: string, color: BackgroundColor.Blue).description
            }
        }
        
        var Magenta: String {
            get {
                return Colorizer(string: string, color: BackgroundColor.Magenta).description
            }
        }
        
        var Cyan: String {
            get {
                return Colorizer(string: string, color: BackgroundColor.Cyan).description
            }
        }
        
        var White: String {
            get {
                return Colorizer(string: string, color: BackgroundColor.White).description
            }
        }
    }

}