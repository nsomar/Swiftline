//
//  TaskPipe.swift
//  TaskPipe
//
//  Created by Omar Abdelhafith on 05/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


protocol TaskPipe {
    func read() -> Data
}

extension Pipe: TaskPipe {
    func read() -> Data {
        return fileHandleForReading.readDataToEndOfFile()
    }
}

struct Dryipe: TaskPipe {
    
    let dataToReturn: Data
    
    func read() -> Data {
        return dataToReturn
    }
}
