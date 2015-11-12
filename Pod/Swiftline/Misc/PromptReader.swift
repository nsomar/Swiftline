//
//  PromptReader.swift
//  PromptReader
//
//  Created by Omar Abdelhafith on 31/10/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


protocol PromptReader {
    func read() -> String?
}

class ConsolePromptReader: PromptReader {
    
    func read() -> String? {
        return readLine()
    }
}

class DummyPromptReader: PromptReader {
    
    var parametersToReturn: [String]
    
    init(toReturn: String...) {
        self.parametersToReturn = toReturn
    }
    
    func read() -> String? {
        return parametersToReturn.removeFirst()
    }
}