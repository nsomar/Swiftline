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

func splitCommandToArgs(command: String) -> [String] {
    if command.containsString(" ") {
        return command.componentsSeparatedByString(" ")
    }
    
    return [command]
}

func readPipe(pipe: TaskPipe) -> String {
    let data = pipe.read()
    return NSString(data: data, encoding: NSUTF8StringEncoding) as? String ?? ""
}