//
//  Colorizer.swift
//  Colorizer
//
//  Created by Omar Abdelhafith on 30/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


class Colorizer: CustomStringConvertible {
    
    let color: StringStyle
    let string: String
    
    init(string: String, color: StringStyle) {
        self.string = string
        self.color = color
    }
    
    var description: String {
        
        get {
            return color.colorize(string: string)
        }
        
    }
}


extension String {
    
    var f: StringForegroundColorizer {
        get { return foreground }
    }
    
    var foreground: StringForegroundColorizer {
        get { return StringForegroundColorizer(string: self) }
    }
    
    var b: StringBackgroundColorizer {
        get { return background }
    }
    
    var background: StringBackgroundColorizer {
        get { return StringBackgroundColorizer(string: self) }
    }
    
    var s: StringStyleColorizer {
        get { return style }
    }
    
    var style: StringStyleColorizer {
        get { return StringStyleColorizer(string: self) }
    }
    
}
