//
//  RunSettings.swift
//  RunSettings
//
//  Created by Omar Abdelhafith on 05/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import Foundation


/// Settings to costumize the run function
public class RunSettings {
    
    /// If set to true, the command wont be run on the system, the stdout will contain the command executed
    public var dryRun = false
    
    /// Which parts of the command to be echoed during execution
    public var echo = EchoSettings.None
    
    /// Run the command in interactive mode; output wont be captured
    public var interactive = false
}


/// Echo settings
public struct EchoSettings: OptionSetType {
    
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