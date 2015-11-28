//
//  Args.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 25/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

//import Foundation

public class Args {
  
  /// Return the list of arguments passed to the script
  public static var all: [String] {
    return ProcessInfo.arguments
  }
  
  static var cachedResults: ParsedArgs?
  
  /// Return a parsed list of arguments containing the flags and the parameters passed to the scripts
  /// The flags are recognized as short flags `-f` or long flags `--force`
  /// The flag value will be the argument that follows the flag
  /// `--` is used to mark the terminatin of the flags
  public static var parsed: ParsedArgs {
    
    if let result = cachedResults where ProcessInfo.cacheResults {
      return result
    }
    
    var result = [String: String]()
    let parsedArges = ArgsParser.parseFlags(all)
    
    parsedArges.0.forEach {
      result[$0.argument.name] = $0.value ?? ""
    }
    
    cachedResults = ParsedArgs(flags: result, parameters: parsedArges.1)
    return cachedResults!
  }
}


public struct ParsedArgs {
  /// Parsed flags will be prepred in a dictionary, the key is the flag and the value is the flag value
  public let flags: [String: String]
  
  /// List of parameters passed to the script
  public let parameters: [String]
}