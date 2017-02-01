//
//  Args.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 25/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//


/// Return the command line arguments passed to the script
public class Args {
  
  /// Return the list of arguments passed to the script
  public static var all: [String] {
    return CommandLine.arguments
  }
  
  static var cachedResults: ParsedArgs?
  
  /// Return a parsed list of arguments containing the flags and the parameters passed to the scripts
  /// The flags are recognized as short flags `-f` or long flags `--force`
  /// The flag value will be the argument that follows the flag
  /// `--` is used to mark the terminatin of the flags
  public static var parsed: ParsedArgs {
    let result = parse(argumens: all, cachedResults: cachedResults)
    cachedResults = result
    return result
  }

  static func parse(argumens: [String], cachedResults: ParsedArgs?) -> ParsedArgs {
    if let result = cachedResults {
      return result
    }

    var parsedFlags = [String: String]()
    let parsedArgs = ArgsParser.parseFlags(argumens)

    parsedArgs.0.forEach {
      parsedFlags[$0.argument.name] = $0.value ?? ""
    }

    var arguments = parsedArgs.1

    // the first argument is always the executable's name
    var commandName = ""
    if let firstArgument = arguments.first { // just in case!
      commandName = firstArgument
      arguments.removeFirst(1)
    }

    return ParsedArgs(command: commandName, flags: parsedFlags, parameters: arguments)
  }

}


public struct ParsedArgs {
  /// The name of the executable that was invoked from the command line
  public let command: String

  /// Parsed flags will be prepred in a dictionary, the key is the flag and the value is the flag value
  public let flags: [String: String]
  
  /// List of parameters passed to the script
  public let parameters: [String]
}
