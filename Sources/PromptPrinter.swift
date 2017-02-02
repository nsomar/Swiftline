//
//  PromptPrinter.swift
//  PromptPrinter
//
//  Created by Omar Abdelhafith on 02/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


protocol PromptPrinter {
    func printString(_ string: String, terminator: String)
}

class ConsolePromptPrinter: PromptPrinter {
    
    func printString(_ string: String, terminator: String = "\n") {
        return print(string, separator: "", terminator: terminator)
    }
}

class DummyPromptPrinter: PromptPrinter {
    
    var printed = ""
    
    func printString(_ string: String, terminator: String = "\n") {
        printed += string + terminator
    }
}
