//
//  Colorizer.swift
//  Colorizer
//
//  Created by Omar Abdelhafith on 30/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation



extension String {
    
    /// Access the methods to change the foreground color
    public var f: StringForegroundColorizer {
        get { return foreground }
    }

    /// Access the methods to change the foreground color
    public var foreground: StringForegroundColorizer {
        get { return StringForegroundColorizer(string: self) }
    }
    
    /// Access the methods to change the background color
    public var b: StringBackgroundColorizer {
        get { return background }
    }

    /// Access the methods to change the background color
    public var background: StringBackgroundColorizer {
        get { return StringBackgroundColorizer(string: self) }
    }
    
    /// Access the methods to change the text style
    public var s: StringStyleColorizer {
        get { return style }
    }

    /// Access the methods to change the text style
    public var style: StringStyleColorizer {
        get { return StringStyleColorizer(string: self) }
    }
    
}

 // MARK- Internal

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