//
//  RunSettings.swift
//  RunSettings
//
//  Created by Omar Abdelhafith on 05/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


/// Settings to costumize the run function
public class RunSettings {
    
    /// Which parts of the command to be echoed during execution
    public var echo = EchoSettings.None
    
    /// Wich executed will be used to run the commands
    public var execution = ExecutionSettings.default
}


/// Execution settings
public enum ExecutionSettings {
    
    /// Run the command on the system
    case `default`
    
    /// Run the command on the system (in different executor)
    case parallelizable
    
    /// Wont be run on the system, the stdout will contain the command executed
    case dryRun

    /// Run the command in interactive mode; output wont be captured
    case interactive

    /// Run the command on the system and the output will be captured in a log file
    case log(file: String)
}


/// Echo settings
public struct EchoSettings: OptionSet {
    
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    /// Dont echo anything, this is the default settings
    public static var None = EchoSettings(rawValue: 0)
    
    /// Echo the stdout from the run command to the terminal
    public static let Stdout  = EchoSettings(rawValue: 1 << 0)
    
    /// Echo the stderr from the run command to the terminal
    public static let Stderr  = EchoSettings(rawValue: 1 << 1)
    
    /// Echo the command executed to the terminal
    public static let Command  = EchoSettings(rawValue: 1 << 2)
}
