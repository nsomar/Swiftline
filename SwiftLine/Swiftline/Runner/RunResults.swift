//
//  RunResult.swift
//  RunResults
//
//  Created by Omar Abdelhafith on 05/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


public struct RunResults {
    let exitStatus: Int
    
    let stdout: String
    let stderr: String
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