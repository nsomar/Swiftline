//
//  Colorizer.swift
//  Colorizer
//
//  Created by Omar Abdelhafith on 30/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


extension String {
    
    /// Access the methods to change the foreground color
    public var f: StringForegroundColorizer {
        return foreground
    }

    /// Access the methods to change the foreground color
    public var foreground: StringForegroundColorizer {
        return StringForegroundColorizer(string: self)
    }
    
    /// Access the methods to change the background color
    public var b: StringBackgroundColorizer {
        return background
    }

    /// Access the methods to change the background color
    public var background: StringBackgroundColorizer {
        return StringBackgroundColorizer(string: self)
    }
    
    /// Access the methods to change the text style
    public var s: StringStyleColorizer {
        return style
    }

    /// Access the methods to change the text style
    public var style: StringStyleColorizer {
        return StringStyleColorizer(string: self)
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
        return color.colorize(string: string)
    }
}