//
//  ShortHandRunner.swift
//  ShortHandRunner

//
//  Created by Omar Abdelhafith on 05/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


/**
 Executes a command and captures its output
 
 - parameter command: the command to execute
 - parameter args:    the parameters to pass to the command
 
 - returns: RunResults describing the command results
 */
public func run(_ command: String, args: String...) -> RunResults {
    return 🏃.run(command, args: args as [String])
}


/**
 Executes a command and captures its output
 
 - parameter command:   the command to execute
 - parameter argString: the arguments passed as a single string
 
 - returns: RunResults describing the command results
 */
public func run(_ command: String, argsString: String) -> RunResults {
  let args = argsString.components(separatedBy: " ").filter { !$0.isEmpty }
  return 🏃.run(command, args: args)
}


/**
 Executes a command and captures its output
 
 - parameter command: the command to execute
 - parameter args:    the parameters to pass to the command
 
 - returns: RunResults describing the command results
 */
public func run(_ command: String, args: [String]) -> RunResults {
    return 🏃.run(command, args: args)
}


/**
 Executes a command and captures its output
 
 - parameter command: the command to execute
 - parameter settingsBlock: block that receives the settings to costumize the behavior of run
 
 - returns: RunResults describing the command results
 */
public func run(_ command: String, settingsBlock: ((RunSettings) -> Void)) -> RunResults {
    return 🏃.run(command, settings: settingsBlock)
}


/**
 Executes a command and captures its output
 
 - parameter command: the command to execute
 - parameter args:    the parameters to pass to the command
 - parameter settingsBlock: block that receives the settings to costumize the behavior of run
 
 - returns: RunResults describing the command results
 */
public func run(_ command: String, args: [String], settings: ((RunSettings) -> Void)) -> RunResults {
    return 🏃.run(command, args: args, settings: settings)
}


/**
  Executes a command and captures its output
 
 - parameter command: the command to execute
 - parameter echo:    echo settings that describe what parts of the command to print
 
- returns: RunResults describing the command results
 */
func run(_ command: String, echo: EchoSettings) -> RunResults {
    return 🏃.run(command, echo: echo)
}

/**
 Execute a command in interactive mode, output won't be captured
 
 - parameter command: the command to execute
 
- returns: executed command exit code
 */
public func runWithoutCapture(_ command: String) -> Int {
    return 🏃.runWithoutCapture(command)
}
