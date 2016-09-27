//
//  RunResult.swift
//  RunResults
//
//  Created by Omar Abdelhafith on 05/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


/**
 *  Structure to hold results from run
 */
public struct RunResults {
    
    /// Command exit status
    public let exitStatus: Int
    
    /// Command output stdout
    public let stdout: String
    
    /// Command output stderr
    public let stderr: String
}

// MARK:- Internal

func splitCommandToArgs(_ command: String) -> [String] {
    if command.contains(" ") {
        return command.components(separatedBy: " ")
    }
    
    return [command]
}

func readPipe(_ pipe: TaskPipe) -> String {
    let data = pipe.read()
    return NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue) as? String ?? ""
}
