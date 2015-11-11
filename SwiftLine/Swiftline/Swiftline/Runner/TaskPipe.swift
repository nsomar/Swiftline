//
//  TaskPipe.swift
//  TaskPipe
//
//  Created by Omar Abdelhafith on 05/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


protocol TaskPipe {
    func read() -> NSData
}

extension NSPipe: TaskPipe {
    func read() -> NSData {
        return self.fileHandleForReading.readDataToEndOfFile()
    }
}

struct Dryipe: TaskPipe {
    
    let dataToReturn: NSData
    
    func read() -> NSData {
        return dataToReturn
    }
}