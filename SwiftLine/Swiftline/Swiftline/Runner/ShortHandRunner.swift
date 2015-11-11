//
//  ShortHandRunner.swift
//  ShortHandRunner

//
//  Created by Omar Abdelhafith on 05/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


/**
 Executes a command and captures its output
 
 - parameter command: the command to execute
 - parameter args:    the parameters to pass to the command
 
 - returns: RunResults describing the command results
 */
public func run(command: String, args: String...) -> RunResults {
    return 🏃.run(command, args: args as [String])
}


/**
 Executes a command and captures its output
 
 - parameter command: the command to execute
 - parameter args:    the parameters to pass to the command
 
 - returns: RunResults describing the command results
 */
public func run(command: String, args: [String]) -> RunResults {
    return 🏃.run(command, args: args as [String])
}


/**
 Executes a command and captures its output
 
 - parameter command: the command to execute
 - parameter settingsBlock: block that receives the settings to costumize the behavior of run
 
 - returns: RunResults describing the command results
 */
public func run(command: String, settingsBlock: (RunSettings -> Void)) -> RunResults {
    return 🏃.run(command, settings: settingsBlock)
}


/**
 Executes a command and captures its output
 
 - parameter command: the command to execute
 - parameter args:    the parameters to pass to the command
 - parameter settingsBlock: block that receives the settings to costumize the behavior of run
 
 - returns: RunResults describing the command results
 */
public func run(command: String, args: [String], settings: (RunSettings -> Void)) -> RunResults {
    return 🏃.run(command, args: args, settings: settings)
}


/**
  Executes a command and captures its output
 
 - parameter command: the command to execute
 - parameter echo:    echo settings that describe what parts of the command to print
 
- returns: RunResults describing the command results
 */
func run(command: String, echo: EchoSettings) -> RunResults {
    return 🏃.run(command, echo: echo)
}

/**
 Execute a command in interactive mode, output won't be captured
 
 - parameter command: the command to execute
 
- returns: executed command exit code
 */
public func runWithoutCapture(command: String) -> Int {
    return 🏃.runWithoutCapture(command)
}