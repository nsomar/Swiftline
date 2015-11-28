//
//  Args.swift
//  Swiftline
//
//  Created by Omar Abdelhafith on 25/11/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

//import Foundation

public class Args {
  
  public static var all: [String] {
    return ProcessInfo.arguments
  }
  
  public static var parsed: ParsedArgs {
    var result = [String: String]()
    let parsedArges = ArgsParser.parseFlags(all)
    
    parsedArges.0.forEach {
      result[$0.argument.name] = $0.value ?? ""
    }
    
    return ParsedArgs(flags: result, parameters: parsedArges.1)
  }
}


public struct ParsedArgs {
  public let flags: [String: String]
  public let parameters: [String]
}