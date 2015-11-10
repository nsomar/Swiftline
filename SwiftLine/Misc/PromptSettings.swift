//
//  PromptSettings.swift
//  PromptSettings
//
//  Created by Omar Abdelhafith on 02/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


class PromptSettings {
    
    static var reader: PromptReader!
    static var printer: PromptPrinter!
    
    class func getReader() -> PromptReader {
        if let reader = PromptSettings.reader {
            return reader
        } else {
            return ConsolePromptReader()
        }
    }
    
    class func getPrinter() -> PromptPrinter {
        if let printer = PromptSettings.printer {
            return printer
        } else {
            return ConsolePromptPrinter()
        }
    }
    
    class func read() -> String? {
        return getReader().read()
    }
    
    class func print(string: String, terminator: String = "\n") {
        return getPrinter().printString(string, terminator: terminator)
    }
}